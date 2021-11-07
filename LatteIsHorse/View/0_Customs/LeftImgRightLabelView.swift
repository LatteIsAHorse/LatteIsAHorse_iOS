//
//  LeftImgRightLabelView.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

class LeftImgRightLabelView: UIView {
    
    let leftImgView = UIImageView()
    
    let rightLabel = UILabel().then {
        $0.font = UIFont.Pretendard(.regular, size: 12)
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        initV()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        initV()
        bindConstraints()
    }

    
    private func initV(){
        _ = [leftImgView, rightLabel].map {self.addSubview($0)}
    }
    
    private func bindConstraints(){
        leftImgView.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        rightLabel.snp.makeConstraints {
            $0.centerY.equalTo(leftImgView)
            $0.leading.equalTo(leftImgView.snp.trailing).offset(4)
            $0.trailing.top.bottom.equalToSuperview()
        }
    }
}
