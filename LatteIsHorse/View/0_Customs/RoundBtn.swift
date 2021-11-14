//
//  RoundBtn.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/12.
//

import UIKit

class RoundBtn: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     
     override func draw(_ rect: CGRect) {
         // Drawing code
         self.clipsToBounds = true
         self.layer.cornerRadius = self.frame.size.height / 2
     }

}
