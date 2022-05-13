import UIKit
import RxSwift

let disposeBag = DisposeBag()

print("---- publisSubject ----")
//서브젝트 생성
let publishSubject = PublishSubject<String>()

//이벤트 스트림 방출
publishSubject.onNext("first event")

//구독
let subscriber1 = publishSubject
    .subscribe(onNext : {
    print($0)
})

//이벤트 방출
publishSubject.onNext("seconde event")
publishSubject.on(.next("third event"))

subscriber1.dispose()

let subscriber2 = publishSubject
    .subscribe(onNext : {
    print($0)
    })

publishSubject.onNext("forth event")

publishSubject.onCompleted()

publishSubject.onNext("last event")

subscriber2.dispose()


print("---- behaviorSubject ----")
enum SubjectError : Error{
    case error1
}

//서브젝트 생성(초기값 필요)
let behaviorSubject = BehaviorSubject<String>(value: "초기값")
behaviorSubject.onNext("first event")

behaviorSubject.subscribe{
    print("first Subscribe : ", $0.element ?? $0)
}.disposed(by: disposeBag)

//값을 꺼내보는 방법
let value = try? behaviorSubject.value()
print(value)

behaviorSubject.onError(SubjectError.error1)

behaviorSubject.subscribe{
    print("second Subscribe : ", $0.element ?? $0)
}.disposed(by: disposeBag)

print("---- ReplaySubject ----")
//서브젝트 생성(버퍼 사이즈)
let replaySubject = ReplaySubject<String>.create(bufferSize: 1)

replaySubject.onNext("first event")
replaySubject.onNext("second event")
replaySubject.onNext("third event")

replaySubject.subscribe{
    print("첫번째 구독 : ", $0.element ?? $0)
}.disposed(by: disposeBag)

replaySubject.subscribe{
    print("두번째 구독 : ", $0.element ?? $0)
}.disposed(by: disposeBag)

replaySubject.onNext("forth event")

replaySubject.onError(SubjectError.error1)
replaySubject.dispose()
