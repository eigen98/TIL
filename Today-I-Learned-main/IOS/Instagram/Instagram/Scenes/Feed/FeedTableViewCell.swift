//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by JeongMin Ko on 2022/05/10.
//

import Foundation
import UIKit
extension UIButton{
    func setImage(systemName : String){
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
final class FeedTableViewCell : UITableViewCell {
    //이미지
    private lazy var postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        return imageView
    }()
    //좋아요 버튼
    private lazy var likeButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(systemName: "heart")
        return button
    }()
    //댓글 버튼
    private lazy var commentButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.setImage(systemName: "message")
        return button
    }()
    //디엠 버튼
    private lazy var directMessageButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.setImage(systemName: "paperplane")
        return button
    }()
    //저장하기 버튼
    private lazy var bookmarkButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.setImage(systemName: "bookmark")
        return button
    }()
    //현재 좋아요 수
    private lazy var contentsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "오늘 저녁 뭐먹냐. 과외는 언제또 갔다오냐. 과제는 언제하고? 근데 왜 이렇게하는데도 모자라냐. 일단 미용실부터 갔다온다. ㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ머ㅏㅈㄷ롬졷래ㅗㅁㅈ;ㄷ러;멎ㄷㄹ;ㅗㅓㅁ;ㅐ러;ㅐ먀ㅓㅈㄷㄹ;ㅐㅑㅓㅁ;ㅐㅈㄷ루;ㅐㅁ젇;ㅐ랴ㅓㅁ;ㅐㅈ덜;ㅣㅏ묻;ㅣ룸;ㅐㅈ댜ㅓㄹ;ㅐ먀ㅓㅈㄷ;ㅐ러;맺댜ㅓㄹ;ㅐ멎ㄷ;ㅐ랴ㅓ;매쟈덜;ㅐㅑ머ㅐㅈ;ㄷ랴ㅓ;ㅐ먀젇ㄹ;ㅐㅑㅓㅁ;패ㅑㅓㅇ;ㅐ포ㅑㅁ;ㅐㅗㄹ;ㅑㅕ모;ㅐㄷㅈ러;ㅐㅁ쟈덜;ㅐㅑ먀ㅗㅓㅈㄷ;ㅐ로;매ㅗㅈㄷㄹ;ㅐㅓㅁㅈ;대러;맺덜"
        return label
    }()
    //현재 좋아요 수
    private lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일전"
        return label
    }()
    
    //현재 좋아요 수
    private lazy var currentLikedCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "홍길동님 외 32명이 좋아합니다."
        return label
    }()
    //레이아웃에 추가.
    func setup(){
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            currentLikedCountLabel,
            bookmarkButton,
            contentsLabel,
            dateLabel
        ].forEach{
            addSubview($0)
        }
        
        postImageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth : CGFloat = 24.0
        let buttonInset : CGFloat = 16.0
        // 버튼 오토 레이아웃
        likeButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        commentButton.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        directMessageButton.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        bookmarkButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        //라벨 오토레이아웃
        currentLikedCountLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        contentsLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        dateLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        
        
        
        
    }
    
}
