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

class SearchBar : UISearchBar {
    let disposeBag = DisposeBag()
    
    let searchButton = UIButton()
    
    //SearchBar 버튼 탭 이벤트
    
    let searchButtonTapped = PublishRelay<Void>()
    
    //SearchBar 외부로 내보낼 이벤트
    var shouldLoadResult
}
