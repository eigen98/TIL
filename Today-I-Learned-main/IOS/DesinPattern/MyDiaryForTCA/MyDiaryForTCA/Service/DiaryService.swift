//
//  DiaryService.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import Foundation
import Combine
import ComposableArchitecture
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

public struct DiaryService {
    private static let diaries = "diaries"
    public var updateSnapshot: () -> Effect<[Diary], ApiFailure>
    public var create: (_ diary: Diary) -> Effect<String, ApiFailure>
    public var delete: (_ documentId: String) -> Effect<String, ApiFailure>
    public var update: (_ diary: Diary) -> Effect<String, ApiFailure>

    public struct ApiFailure: Error, Equatable {
        public let message: String

        public init(message: String) {
            self.message = message
        }
    }

    public init(updateSnapshot: @escaping () -> Effect<[Diary], ApiFailure>,
                create: @escaping (Diary) -> Effect<String, ApiFailure>,
                delete: @escaping (String) -> Effect<String, ApiFailure>,
                update: @escaping (Diary) -> Effect<String, ApiFailure>) {
        self.updateSnapshot = updateSnapshot
        self.create = create
        self.delete = delete
        self.update = update
    }
}

public extension DiaryService {
    static let live = DiaryService {
        .run { subscriber in
            Firestore.firestore().collection(Self.diaries).order(by: "created_at").addSnapshotListener { snapshot, error in
                print("update snapshot")
                if let error = error {
                    subscriber.send(
                        completion: .failure(
                            .init(message: error.localizedDescription)
                        )
                    )
                }
                guard let documents = snapshot?.documents else {
                    subscriber.send(
                        completion: .failure(
                            .init(message: "Snapshot is nil.")
                        )
                    )
                    return
                }
                var diaries: [Diary] = []
                documents.forEach { content in
                    do {
                        var diary = try Firestore.Decoder().decode(Diary.self, from: content.data())
                        // 明示的に代入しないとnilになる
                        diary.id = content.documentID
                        diaries.append(diary)
                    } catch {
                        subscriber.send(
                            completion: .failure(
                                .init(message: error.localizedDescription)
                            )
                        )
                    }
                }
                subscriber.send(diaries)
            }
            return AnyCancellable {
                print("cancel")
            }
        }
    } create: { diary in
        .future { callback in
            var ref: DocumentReference?
            ref = Firestore.firestore().collection(Self.diaries).addDocument(data: [
                "title": diary.title,
                "type": diary.type,
                "content": diary.content,
                "user_id": diary.userId,
                "created_at": Timestamp(date: Date()),
                "when": diary.when,
                "where": diary.where_,
                "who": diary.who,
                "why": diary.why,
                "how": diary.how,
                "happened": diary.happened,
            ]) { error in
                if let error = error {
                    callback(.failure(.init(message: "Create diary error")))
                }
                if let documentId = ref?.documentID {
                    callback(.success(documentId))
                }
                callback(.failure(.init(message: "Failed create diary")))
            }
        }
    } delete: { documentId in
        .future { callback in
            Firestore.firestore().collection(Self.diaries).document(documentId).delete { error in
                if let error = error {
                    callback(.failure(.init(message: "Delete diary error")))
                }
                callback(.success(documentId))
            }
        }
    }

    update: { diary in
        .future { callback in
            guard let documentId = diary.id else {
                callback(.failure(.init(message: "Document id is empty.")))
                return
            }
            Firestore.firestore().collection(Self.diaries).document(documentId).updateData([
                "title": diary.title,
                "type": diary.type,
                "content": diary.content,
                "user_id": diary.userId,
                "created_at": Timestamp(date: Date()),
                "when": diary.when,
                "where": diary.where_,
                "who": diary.who,
                "why": diary.why,
                "how": diary.how,
                "happened": diary.happened,
            ]) { error in
                if let error = error {
                    callback(.failure(.init(message: "Edit diary error")))
                }
                callback(.success(documentId))
            }
        }
    }
}

public extension DiaryService {
    static let mock = DiaryService {
        .run { subscriber in
            subscriber.send([
                Diary(title: "오늘은 컴포즈 카페를 왔다.",
                      content: "알바가 음료 메뉴를 착각하는 실수를 했다. 예전에 카페 알바하던 때가 생각이 난다.",
                      userId: 1,
                      createdAt: Date())
            ])
            return AnyCancellable {}
        }
    } create: { _ in
        .future { callback in
            callback(.success(""))
        }
    } delete: { documentId in
        .future { callback in
            callback(.success(documentId))
        }
    } update: { diary in
        .future { callback in
            // swiftlint:disable force_unwrapping
            callback(.success(diary.id!))
        }
    }
}
