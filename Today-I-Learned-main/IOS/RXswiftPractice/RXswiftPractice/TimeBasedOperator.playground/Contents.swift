import UIKit
import RxSwift

let disposeBag = DisposeBag()

//버퍼의 개수만큼 과거의 이벤트를 받아볼 수 있음.
print("---- replay ----")
let 인사말 = PublishSubject<String>()
let 반복하는앵무새 = 인사말.replay(1)
반복하는앵무새.connect()

인사말.onNext("1. hello")
인사말.onNext("2. hi")

반복하는앵무새
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

인사말.onNext("3. 안녕하세요")

print("---- replayAll ----")
let 닥터스트레인지 = PublishSubject<String>()
let 타임스톤 = 닥터스트레인지.replayAll()

타임스톤.connect()

닥터스트레인지.onNext("도르마무")
닥터스트레인지.onNext("거래를 하러왔다")

타임스톤.subscribe(onNext : {
    print($0)
}).disposed(by: disposeBag)


print("---- buffer ----")
let source = PublishSubject<String>()

var count = 0
let timer = DispatchSource.makeTimerSource()

timer.schedule(deadline: .now()+2 , repeating: .seconds(1))
timer.setEventHandler{
    count += 1
    source.onNext("\(count)")
}
timer.resume()

source.buffer(timeSpan: .seconds(2), count: 2, scheduler: MainScheduler.instance)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)


//버퍼와 비슷. 버퍼가 Array를 방출하면 window는 observable을 방출
print("---- window ----")
let 만들어낼최대Observable수 = 1
let 만들시간 = RxTimeInterval.seconds(2)

let window = PublishSubject<String>()

var windowCount = 0
let windowTimerSource = DispatchSource.makeTimerSource()
windowTimerSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
windowTimerSource.setEventHandler{
    windowCount += 1
    window.onNext("\(windowCount)")
}
windowTimerSource.resume()

window
    .window(timeSpan: 만들시간, count: 만들어낼최대Observable수, scheduler: MainScheduler.instance)
    .flatMap{ windowObservable -> Observable<(index : Int, element : String)> in
        return windowObservable.enumerated()
    }
    .subscribe(onNext : {
        print("\($0.index) 번째 Observable의 요소 \($0.element)")
    }).disposed(by: disposeBag)


//print("---- delaySubscription ----") //구독을 뒤로 미룸
//let delaySource  = PublishSubject<String>()
//
//var delayCount = 0
//let delayTimeSource = DispatchSource.makeTimerSource()
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler{
//    delayCount += 1
//    delaySource.onNext("\(delayCount)")
//}
//delayTimeSource.resume()
//
//delaySource.delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
//    .subscribe(onNext : {
//        print($0)
//    })
//    .disposed(by: disposeBag)


//전체 시퀀스를 지연 // 요소의 방출을 미룸
print("---- delay ----")
let delaySubject = PublishSubject<Int>()

var delayCount = 0
var delayTimerSource = DispatchSource.makeTimerSource()
delayTimerSource.schedule(deadline: .now(), repeating: .seconds(1))
delayTimerSource.setEventHandler{
    delayCount += 1
    delaySubject.onNext(delayCount)
    
}
delayTimerSource.resume()

delaySubject.delay(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)


//최근에는 디스패치 프레임워크가 디스패치 소스를 통해서 타이머를 제공했는데
//기존에 NSTimer보단 나은 솔루션이지만 이벤트핸들러 맵핑없이는 복잡
//RX에서는 인터벌이 있음.
print("---- interval ----")
//어떠한 형태의 생성자 없이도 interval오퍼레이터가 일련의 element를 방출함.
Observable<Int>
    .interval(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)


print("---- timer ----")
//인터벌과 유사하지만 두가지 차이점.
//구독과 방출 사이에 마감일을 설정. 반복 기간이 옵셔널임 설정 안하면 한번 방출하고 끝
Observable<Int>
    .timer(.seconds(5), period: .seconds(2), scheduler: MainScheduler.instance)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)


import RxCocoa
import PlaygroundSupport

print("---- timeOut ----")
let 누르지않으면에러 = UIButton(type: .system)
누르지않으면에러.setTitle("눌러주세요!", for: .normal)
누르지않으면에러.sizeToFit()

PlaygroundPage.current.liveView = 누르지않으면에러

누르지않으면에러.rx.tap
    .do(onNext: {
        print("tap")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)
