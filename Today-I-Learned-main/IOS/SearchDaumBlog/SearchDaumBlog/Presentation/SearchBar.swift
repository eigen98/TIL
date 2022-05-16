//
//  SearchBar.swift
//  SearchDaumBlog
//
//  Created by JeongMin Ko on 2022/05/14.
//

import Foundation

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class SearchBar : UISearchBar {
    let disposeBag = DisposeBag()
    
    let searchButton = UIButton()
    
    //SearchBar 버튼 탭 이벤트
    
    let searchButtonTapped = PublishRelay<Void>()
    
    //SearchBar 외부로 내보낼 이벤트
    var shouldLoadResult = Observable<String>.of("")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        //searchBar search button 탭되었을 때 (키워드 입력 후 엔터)
        //button 탭되었을때
        //두가지 버튼 모두 탭되었을때 동일하게 실행
        //어떤 옵저버블이든 발생되면 순서와 관계없이 탭 이벤트라고 봄 => Combine 오퍼레이터인 merge 사용
        Observable.merge(
            self.rx.searchButtonClicked.asObservable(), //Observable로 변환
            searchButton.rx.tap.asObservable()
        )
            .bind(to: searchButtonTapped)//두가지 옵저버블이 이벤트 발생할 때마다 PublishRelay에 바인딩 되어서 해당 서브젝트가 이벤트를 가질 수 있게됨.
            .disposed(by: disposeBag)
        
        //묶여진 이벤트가 발생할 때 어떠한 상황이 벌어질까 -> 서치바 기준으로 endEditing 델리게이션 발생.키보드 내려가기?
        searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        self.shouldLoadResult = searchButtonTapped //트리거 역할
            .withLatestFrom(self.rx.text){ $1 ?? "" }
            .filter{ !$0.isEmpty }
            .distinctUntilChanged()
    }
    
    private func attribute(){
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.systemBlue, for: .normal)
    }
    private func layout(){
        addSubview(searchButton)
        
        searchTextField.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(searchButton.snp.leading).offset(12)
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
}
extension Reactive where Base : SearchBar {
    var endEditing : Binder<Void> {
        return Binder(base){ base, _ in
            base.endEditing(true)
        }
    }
}
