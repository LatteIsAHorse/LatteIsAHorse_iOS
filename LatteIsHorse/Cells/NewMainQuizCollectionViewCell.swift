//
//  NewMainQuizCollectionViewCell.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/19.
//

import UIKit

class NewMainQuizCollectionViewCell: UICollectionViewCell {
    
    
    static let registerID = "\(NewMainQuizCollectionViewCell.self)"
    
    let imgView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        //$0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "testIMG")
    }
    
    let questionLabel = UILabel().then {
        $0.font = UIFont.StylePretendard(.h2)
        $0.textColor = .black
        $0.numberOfLines = 0
       // $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let gradeView = LeftImgRightLabelView().then {
        $0.leftImgView.image = UIImage(named: "circlegray")
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let seeView = LeftImgRightLabelView().then {
        $0.leftImgView.image = UIImage(named: "view")
        //$0.translatesAutoresizingMaskIntoConstraints = false
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
        _ = [imgView,questionLabel,gradeView,seeView].map {self.addSubview($0)}
        self.backgroundColor = .white
    }
    private func bindConstraints(){
        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(imgView.snp.leading).offset(-16)
        }
        imgView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-26)
            $0.top.equalTo(questionLabel)
            $0.width.equalToSuperview().multipliedBy(0.204)
            $0.height.equalTo(imgView.snp.width)
        }
        gradeView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(52)
            $0.leading.equalTo(questionLabel)
        }
        seeView.snp.makeConstraints {
            $0.top.equalTo(gradeView.snp.bottom).offset(33)
            $0.leading.equalTo(questionLabel)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}
