import UIKit
import RxSwift

let disposeBag = DisposeBag()

enum TraitsError : Error {
    case single
    case maybe
    case completetable
}

//print("---- single1 ----")
//Single<String>.create{ observer -> Disposable in
//    observer.onError(TraitsError.single)
//    return Disposables.create()
//}
//.subscribe(onSuccess: {
//
//    print($0)
//
//},
//           onFailure: {
//        print("error: \($0)")
//    },
//
//            onDisposed: {
//        print("disPosed")
//    }
//
//    ).disposed(by: disposeBag)
print("---- single2 ----")
Observable<String>.create{ observer -> Disposable in
    observer.onError(TraitsError.single)
    return Disposables.create()
}
    .asSingle()
    .subscribe(onSuccess: { print($0) },
               onFailure: { print("error: \($0.localizedDescription)") } ,
               onDisposed: {print("disPosed")}
    )
    .disposed(by: disposeBag)


print("---- maybe ----")
Maybe<String>.just("check")
    .subscribe(
        onSuccess: {
        print($0)
    },
               
        onError: {
            print($0)
        },
        
        onCompleted: {
            print("completed")
        },
               
        onDisposed: {
            print("disposed")
        })
    .disposed(by: disposeBag)


print("---- Maybe2 ----")
Observable<String>.create{ observer -> Disposable in
    observer.onError(TraitsError.single)
    return Disposables.create()
}
.asMaybe()
.subscribe(
    onSuccess: {
    print("성공 \($0)")
},
           
    onError: {
        print("에러 \($0)")
    },
    
    onCompleted: {
        print("completed")
    },
           
    onDisposed: {
        print("disposed")
    })
.disposed(by: disposeBag)



print("---- Completable ----")
Completable.create { observer -> Disposable in
    observer(.error(TraitsError.completetable))
    return Disposables.create()
}
.subscribe(
    onCompleted: {
    print("completed")
},
           
    onError: {
    print("error :\($0)")
},
           
    onDisposed: {
    print("disposed")
})
