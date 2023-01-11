//
//  DiaryReactor.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//


import Combine
import ComposableArchitecture
import Firebase
import FirebaseFirestoreSwift


//MARK: ReactorKit에서 Reactor와 매핑되는 개념이라서 Reactor로 설정.

// MARK: State
public struct DiaryState : Equatable{
    public var diaries : [Diary]
    public var filteredDiaries : [Diary] {
        if searchText.isEmpty{
            return diaries
        }
        return diaries.filter{
            $0.title.contains(searchText) || $0.content.contains(searchText)
        }
    }
    
    public var searchText: String
    public var isSearching: Bool
    
    public init() {
        diaries = []
        searchText = ""
        isSearching = false
    }
}
// MARK: Action
public enum DiaryAction: Equatable {
    case deleteButtonTapped(Int)
    case startObserve
    case chageSearchText(String)
    case resetSearchText
    case updateDiaries(Result<[Diary], DiaryService.ApiFailure>)
    case deleteResponse(Result<String, DiaryService.ApiFailure>)
}
// MARK: Environment
public struct DiaryEnvironment {
    var client: DiaryService
    var mainQueue: AnySchedulerOf<DispatchQueue>

    public init(client: DiaryService, mainQueue: AnySchedulerOf<DispatchQueue>) {
        self.client = client
        self.mainQueue = mainQueue
    }
}

// MARK: reducer
public let diaryReducer = Reducer<DiaryState, DiaryAction, DiaryEnvironment> { state, action, environment in
    switch action {
    case let .chageSearchText(text):
        state.searchText = text
        state.isSearching = !state.searchText.isEmpty
        return .none
    case .resetSearchText:
        state.searchText = ""
        state.isSearching = false
        return .none
    case .startObserve:
        return environment.client
            .updateSnapshot()
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(DiaryAction.updateDiaries)
    case let .updateDiaries(.success(diaries)):
        state.diaries = diaries
        return .none
    case let .updateDiaries(.failure(failure)):
        print("error: \(failure)")
        return .none
    case let .deleteButtonTapped(index):
        let targetDiary = state.diaries[index]
        guard let documentId = targetDiary.id else {
            fatalError("Document id is empty.")
        }
        return environment.client
            .delete(documentId)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(DiaryAction.deleteResponse)
    case let .deleteResponse(.success(documentId)):
        return .none
    case let .deleteResponse(.failure(error)):
        return .none
    }
}
