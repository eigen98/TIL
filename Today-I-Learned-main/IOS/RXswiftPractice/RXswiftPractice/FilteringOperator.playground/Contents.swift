import UIKit

import RxSwift

let disposeBag = DisposeBag()

//ignoreElements : Next이벤트를 무시. completed와 error를 받음.
print("ignoreElements")
let sleepMode = PublishSubject<String>()
sleepMode.ignoreElements()
    .subscribe{ _ in
        print("ok")
    }.disposed(by: disposeBag)

sleepMode.onNext("new signal")
sleepMode.onNext("new signal")
sleepMode.onNext("new signal")

sleepMode.onCompleted()

// elementAt : 해당 인덱스에 해당하는 값만 방출. 특정 인덱스 지칭
print("---- elementAt ----")
let reciever = PublishSubject<String>()

reciever.element(at: 2)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

reciever.onNext("1 signal") //index 0
reciever.onNext("2 signal") //index 1
reciever.onNext("3 signal")
reciever.onNext("4 signal")

// filter : 필터링 요구사항이 한가지 이상일때 사용
print("---- filter ----")
Observable.of(1,2,3,4,5,6,7,8)
    .filter{
        $0 % 2 == 0
    }.subscribe( onNext : {
        print($0)
    }).disposed(by: disposeBag)

// skip : 첫 요소를 기준으로 원하는 카운트만큼 스킵
print("---- skip ----")
Observable.of(1,2,3,4,5,6,7,8)
    .skip(5)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)


// skipWhile : 원하는 요소까지 스킵
print("---- skipWhile ----")
Observable.of(1,2,3,4,5,6,7,8)
    .skip(while: {
        $0 != 3
    })
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

// skipUntil : 다른 Observable에 기반한 요소들을 다이나믹하게 필터링
print("---- skipUntil ----")
let recieverC = PublishSubject<String>()
let time = PublishSubject<String>()

recieverC
    .skip(until: time)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

recieverC.onNext("first")
recieverC.onNext("second")
recieverC.onNext("third")

time.onNext("start")

recieverC.onNext("fourh")
recieverC.onNext("fifth")

// take : skip의 반대. 원하는 요소까지 값을 받음.
print("---- take ----")
Observable.of(1,2,3,4,5,6,7,8)
    .take(3)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

print("---- enumerated﻿ ----")
Observable.of(1,2,3,4,5,6,7,8)
    .enumerated()
    .takeWhile{
        $0.index < 5
    }.subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

print("---- takeUnntil ----")
let apply  = PublishSubject<String>()
let end = PublishSubject<String>()

apply.take(until : end)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

apply.onNext("apply1")
apply.onNext("apply2")

end.onNext("finish")

apply.onNext("apply3")
apply.onNext("apply4")


print("---- distinctUntilChanged﻿ ----")
Observable.of(1,2,2,3,3,4,4,4,5,6,7,8,8)
    .distinctUntilChanged()
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)
