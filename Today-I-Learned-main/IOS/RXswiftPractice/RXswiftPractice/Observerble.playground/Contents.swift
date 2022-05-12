import Foundation
import RxSwift
import Darwin

//하나의 Element만 방출하는 Observable생성
print("----Just-----")
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })
//다양한 형태의 이벤트를 넣을 수 있는 Observable생성.
print("----Of----")
Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })

//사실상 하나의 배열만 방출하므로 just와 같음
print("----Of----")
Observable<[Int]>.of([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })
Observable<[Int]>.just([1,2,3,4,5])

//Array 형태의 Element만 받음.
print("----From----")
Observable.from([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })

print("---- subscribe1 ----")
Observable.of(1,2,3)
    .subscribe{
        print($0)
    }

print("---- subscribe2 ----")
Observable.of(1,2,3)
    .subscribe{
        if let element = $0.element{
            print(element)
        }
    }

print("---- subscribe3 ----")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    }
)


print("---- empty ----")
Observable.empty()
    .subscribe (
        onNext : {
            print($0)
        },
        onCompleted : {
            print("Completed")
        }
    
    )

print("---- never ----")
Observable.never()
    .debug("never")
    .subscribe (
        onNext : {
            print($0)
        },
        onCompleted : {
            print("Completed")
        }
    
    )

print("---- range ----")
Observable.range(start: 1, count: 9)
    .subscribe (
        onNext : {
            print("9*\($0)= \(9*$0)")
        },
        onCompleted : {
            print("Completed")
        }
    
    )


print("---- dispose ----")
Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })
    .dispose()

print("---- disposeBag ----")
let disposeBag = DisposeBag()
Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("---- create ----")
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}.subscribe{
    print($0)
}.disposed(by: disposeBag)


print("---- create2 ----")
enum MyError : Error {
    case anError
}
Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onNext(2)
    return Disposables.create()
}.subscribe(
    onNext : {
        print($0)
    },
    onError : {
        print($0.localizedDescription)
    },
    onCompleted : {
        print("completed")
    },
    onDisposed : {
        print("disposed")
    }
    
).disposed(by: disposeBag)

print("---- differed ----")
var onOff : Bool = false

let factory : Observable<Int> = Observable.deferred {
    onOff = !onOff
    
    if onOff {
        return Observable.of(1)
    }else {
        return Observable.of(2)
    }
    
}
for _ in 0...3{
    factory.subscribe( onNext :{
    
        print($0)
    }).disposed(by: disposeBag)
}
