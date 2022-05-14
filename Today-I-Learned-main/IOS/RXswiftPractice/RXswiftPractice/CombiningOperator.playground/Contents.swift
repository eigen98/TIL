import UIKit

import RxSwift

let disposeBag = DisposeBag()

print("---- startWith ----")
let REDTeam = Observable<String>.of("A","B","C")

REDTeam.startWith("eCouch")
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

print("---- concat1 ----")
let RedJuniors = Observable<String>.of("a","b","c")
let RedCouch = Observable<String>.of("A")

let move = Observable.concat([RedJuniors, RedCouch])

move.subscribe(onNext : {
    print($0)
}).disposed(by: disposeBag)

print("---- concat2 ----")
RedCouch
    .concat(RedJuniors)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

//flatMap과 유사, 각각의 시퀀스가 다음시퀀스가 구독되기전 합쳐지는 것을 보존
//두개의 시퀀스를 append
print("---- concatMap ----")
let house : [String : Observable<String>] = [
    "RedTeam": Observable.of("a","b","c"),
    "BlueTeam" : Observable.of("1","2")
]
Observable.of("RedTeam", "BlueTeam")
    .concatMap{ Team in
        house[Team] ?? .empty()
    }.subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

//순서 보장없이 섞여서 합침.
print("---- merge1 ----")
let 강북 = Observable.from(["강북구", "성북구", "동대문구", "종로구"])
let 강남 = Observable.from(["강남구", "강동구", "영등포구", "양천구"])

Observable.of(강북, 강남)
    .merge()
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)
print("---- merge2 ----")
Observable.of(강북,강남)
    .merge(maxConcurrent: 1) //한번에 받아낼 Observable의 수
    .subscribe(onNext : {
        print($0)
    })



print("---- combineLatest1﻿ ----")
let 성 = PublishSubject<String>()
let 이름 = PublishSubject<String>()

let 성명 = Observable
    .combineLatest(성, 이름) { 성, 이름 in
        성 + 이름
    }

성명.subscribe(onNext : {
    print($0)
}).disposed(by: disposeBag)

성.onNext("김")
이름.onNext("똘똘")
이름.onNext("영수")
이름.onNext("은영")
성.onNext("박")
성.onNext("이")
성.onNext("조")

print("---- combineLatest2 ----")
let 날짜표시형식 = Observable<DateFormatter.Style>.of(.short, .long)
let 현재날짜 = Observable.of(Date())

let 현재날짜표시 = Observable
    .combineLatest(날짜표시형식, 현재날짜, resultSelector: { 형식, 날짜 -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = 형식
        return dateFormatter.string(from: 날짜)
    })

현재날짜표시
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

print("---- combineLatest3 ----")
let lastName = PublishSubject<String>() //성
let firstName = PublishSubject<String>() //이름

let fullName = Observable
    .combineLatest([firstName, lastName]){ name in
        name.joined(separator: " ")
        
    }
fullName
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

lastName.onNext("Kim")
firstName.onNext("paul")
firstName.onNext("Stella")
firstName.onNext("Lily")


print("---- zip ----")
enum 승패{
    case 승
    case 패
}
let 승부 = Observable<승패>.of(.승, .승, .패, .승, .패)
let 선수 = Observable<String>.of("a","b","c","d","e","f")

let 시합결과 = Observable
    .zip(승부, 선수){ 결과, 대표선수 in
        return 대표선수 + "선수" + " \(결과)"
    }

시합결과
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

//방아쇠역할을 하게 해줌. 방아쇠 이벤트가 발생해야 다음 이벤트가 나타남(그중에 최신의 값만)
print("---- withLatestFrom ----")
let bang = PublishSubject<Void>()
let 달리기선수 =  PublishSubject<String>()

bang
    .withLatestFrom(달리기선수)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

달리기선수.onNext(" 1번 ")
달리기선수.onNext(" 2번 ")
달리기선수.onNext(" 3번 ")

bang.onNext(Void())
bang.onNext(Void())
//한번만 방아쇠를 방출
print("---- sample﻿ ----")
let 출발 = PublishSubject<Void>()
let F1선수 = PublishSubject<String>()

F1선수
    .sample(출발)
    .subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

F1선수.onNext("a")
F1선수.onNext("a    b")
F1선수.onNext("a      b   c")
출발.onNext(Void()) //출발사인이 여러번 작동해도 한번만 호출.
출발.onNext(Void())
출발.onNext(Void())

//애매모호할때, 지켜보다가 하나가 먼저 방출하면 나머지는 취급안함
print("---- amb ----")
let bus1 = PublishSubject<String>()
let bus2 = PublishSubject<String>()

let busStation = bus1.amb(bus2)

busStation
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)
bus2.onNext("bus2 - 승객0 : A")
bus1.onNext("bus1 - 승객0 : B")
bus1.onNext("bus1 - 승객1 : C")
bus2.onNext("bus2 - 승객1 : D")
bus1.onNext("bus1 - 승객1 : E")
bus2.onNext("bus2 - 승객2 : F")

//손들기라는 SourceObservable로 들어온 마지막 시퀀스의 아이템만 구독하는 것
print("---- switchLatest﻿ ----")
let 학생1 = PublishSubject<String>()
let 학생2 = PublishSubject<String>()
let 학생3 = PublishSubject<String>()

let 손들기 = PublishSubject<Observable<String>>()

let 손든사람만말할수있는교실 = 손들기.switchLatest()
손든사람만말할수있는교실.subscribe(onNext : {
    print($0)
})
    .disposed(by: disposeBag)

손들기.onNext(학생1)
학생1.onNext("학생 1 : 안녕하세요")
학생2.onNext("학생 2 : 저요 저요")

손들기.onNext(학생2)
학생2.onNext("학생 2 : 2번입니다.")
학생1.onNext("학생 1 : 1번 안끝났는데요 저")

손들기.onNext(학생3)
학생2.onNext("학생 2 : 2번이라구요.")
학생1.onNext("학생 1 : xxxxxxxxxx")
학생3.onNext("학생 3 : 저는 3번입니다. ")

손들기.onNext(학생1)
학생2.onNext("학생 2 : 2번빼고 조용조용.")
학생1.onNext("학생 1 : ㅠㅠ")
학생3.onNext("학생 3 : 3번도요. ")


print("---- reduce ----")
Observable.from((1...10))
    .reduce(0, accumulator: { summary, newValue in
        return summary + newValue
        
        
    }).subscribe(onNext : {
        print($0)
    }).disposed(by: disposeBag)

print("---- scan ----")
Observable.from((1...10))
    .scan(0, accumulator: +)
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)
