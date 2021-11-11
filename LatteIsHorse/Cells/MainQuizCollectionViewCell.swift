//
//  MainQuizCollectionViewCell.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

class MainQuizCollectionViewCell: UICollectionViewCell {
    
    static let registerID = "\(MainQuizCollectionViewCell.self)"
    
    let imgView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let questionLabel = UILabel().then {
        $0.font = UIFont.Pretendard(.bold, size: 13)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    let gradeView = LeftImgRightLabelView().then {
        $0.leftImgView.image = UIImage(named: "circlegray")
    }
    
    let seeView = LeftImgRightLabelView().then {
        $0.leftImgView.image = UIImage(named: "view")
    }
    
    let ddabongView = LeftImgRightLabelView().then {
        $0.leftImgView.image = UIImage(named: "ddabong")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initV()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initV()
        bindConstraints()
    }
    
    private func initV(){
        _ = [imgView,questionLabel,gradeView,seeView,ddabongView].map {self.addSubview($0)}
    }
    private func bindConstraints(){
        imgView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imgView.snp.width).multipliedBy(0.6585)
        }
        
        questionLabel.snp.makeConstraints {
            $0.leading.equalTo(imgView)
            $0.top.equalTo(imgView.snp.bottom).offset(12)
            $0.trailing.equalTo(imgView)
        }
        
        gradeView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(3)
        }
        
        seeView.snp.makeConstraints {
            $0.top.equalTo(gradeView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        ddabongView.snp.makeConstraints {
            $0.centerY.equalTo(seeView)
            $0.leading.equalTo(seeView.snp.trailing).offset(18.67)
        }
    }
}
