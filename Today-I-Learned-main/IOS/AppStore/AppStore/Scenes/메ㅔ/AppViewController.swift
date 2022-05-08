//
//  AppViewController.swift
//  AppStore
//
//
//

import Foundation

import UIKit

final class AppViewController : UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    //스택뷰
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical //방향
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints{
            $0.height.equalTo(100.0)
        }

        rankingFeatureSectionView.backgroundColor = .yellow
        
        [featureSectionView,
        rankingFeatureSectionView,
         exchangeCodeButtonView,
        spacingView].forEach{
            
            stackView.addArrangedSubview($0)//스택뷰에 추가.
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    // 네비게이션바 설정
    func setupNavigationController(){
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //컴포넌트 레이아웃 설정
    func setupLayout(){
        //스크롤 뷰 추가
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        //스크롤뷰에 컨텐츠 뷰 추가
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() //컨텐츠뷰가 세로스크롤이므로
        }
        //컨텐츠뷰에 스택뷰 추가
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
