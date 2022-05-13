import UIKit
import RxSwift
import Foundation

let disposeBag = DisposeBag()

//toArray : Single로 바뀌고 Array를 반환
print("---- toArray ----")
Observable.of(1,2,3,4,5,6,7,8,9)
    .toArray()
    .subscribe(onSuccess : {
        print($0)
    }).disposed(by: disposeBag)

//map :
print("---- map ----")
Observable.of(Date())
    .map{date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
        
    }
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

//중첩된 Observable이라면? Observable<Observable<String>>
print("---- flatMap ----")
protocol player {
    var point : BehaviorSubject<Int> { get }
    
}
struct SoccerPlayer : player {
    var point: BehaviorSubject<Int>
}
let koreanPlayer  = SoccerPlayer(point: BehaviorSubject(value: 10))
let usaPlayer = SoccerPlayer(point: BehaviorSubject(value: 3))

let titleMatch = PublishSubject<player>() //중첩된 Observable
titleMatch
    .flatMap{
        player in
        player.point
    }
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: disposeBag)

titleMatch.onNext(koreanPlayer)
koreanPlayer.point.onNext(10)

titleMatch.onNext(usaPlayer)
koreanPlayer.point.onNext(10)
usaPlayer.point.onNext(4)


print("---- flatMapLatest ----")
struct boxingPlayer : player {
    var point: BehaviorSubject<Int>
}

let seoul = boxingPlayer(point: BehaviorSubject<Int>(value: 7))
let busan = boxingPlayer(point: BehaviorSubject<Int>(value: 7))

let rookieKingTitle = PublishSubject<player>()

rookieKingTitle.flatMapLatest{player in
    player.point
    
}.subscribe(onNext : {
    print($0)
})
    .disposed(by: disposeBag)

rookieKingTitle.onNext(seoul)
seoul.point.onNext(9)

rookieKingTitle.onNext(busan)
seoul.point.onNext(5)
busan.point.onNext(3)


                         
                         
