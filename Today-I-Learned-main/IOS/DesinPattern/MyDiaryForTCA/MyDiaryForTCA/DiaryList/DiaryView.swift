//
//  DiaryView.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//


import Combine
import ComposableArchitecture
import SwiftUI


struct DiaryView: View {
    private let store: Store<DiaryState, DiaryAction>
    private var isSearch = false
    @State var isSetting = false
    
    public init(store: Store<DiaryState, DiaryAction>) {
        self.store = store
        ViewStore(store).send(.startObserve)
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                VStack {
                    List {
                        Section {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.leading, -12)
                                TextField("검색",
                                          text: viewStore.binding(
                                            get: \.searchText,
                                            send: DiaryAction.chageSearchText
                                          ))
                            }
                            .overlay(
                                HStack {
                                Spacer()
                                if viewStore.state.isSearching {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .onTapGesture {
                                            ViewStore(store).send(DiaryAction.resetSearchText)
                                        }
                                }
                            }
                            )
                        }
                        Section(header: HStack {
                            Image(systemName: "folder")
                            Spacer()
                            NavigationLink(
                                destination: CreateDiaryView(
                                    store: .init(
                                        initialState: .init(),
                                        reducer: createDairyReducer,
                                        environment: .init(
                                            client: .live,
                                            mainQueue: .main.eraseToAnyScheduler()
                                        )
                                    )
                                )
                            ) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.body)
                            }
                        }) {
                            ForEach(viewStore.state.filteredDiaries, id: \.self) { diary in
//                                NavigationLink(
//                                    destination: DiaryDetailView(
//                                        store: .init(
//                                            initialState: .init(diary: diary),
//                                            reducer: diaryDetailReducer,
//                                            environment: .init(
//                                                client: .live,
//                                                mainQueue: .main.eraseToAnyScheduler()
//                                            )
//                                        )
//                                    ),
//                                    label: {
//                                    SeedCell(diary: diary)
//                                        .padding(.bottom, 8)
//                                        .padding(.top, 8)
//                                }
//                                )
//                                    .contextMenu(
//                                        menuItems: {
//                                        HStack {
//                                            Text(diary.title)
//                                            Text(diary.content)
//                                        }
//                                    }
//                                    )
//                            }.onDelete { offsets in
//                                guard let index = offsets.first else { return }
//                                ViewStore(store).send(.deleteButtonTapped(index))
                            }
                        }
                    }.animation(.easeIn)
                        .listStyle(InsetGroupedListStyle())
                }
                .sheet(isPresented: $isSetting) {
//                    SettingView(
//                        store: .init(
//                            initialState: .init(),
//                            reducer: settingReducer,
//                            environment: .init(
//                                mainQueue: .main.eraseToAnyScheduler()
//                            )
//                        )
//                    )
                }
                .navigationBarItems(
                    trailing:
                        Button(action: {
                    isSetting = true
                }) {
                    Image(systemName: "gearshape")
                }
                )
            }
        }
    }

    func didDismiss() {}
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(
            store: .init(
                initialState: DiaryState(),
                reducer: diaryReducer,
                environment: .init(
                    client: .mock,
                    mainQueue: .main.eraseToAnyScheduler()
                )
            )
        )
    }
}
