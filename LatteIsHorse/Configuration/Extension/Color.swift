//
//  Color.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainBG : UIColor { UIColor(hex: 0xF2F3F5) }
    class var quizAnsBG : UIColor { UIColor(hex: 0xF0F1F2)}
    class var btnBlue : UIColor { UIColor(hex: 0x2D46C8)}
    class var ansPick : UIColor { UIColor(hex: 0x4ADB5A)}
    class var mainYellow : UIColor { UIColor(hex: 0xFFD800)}
    class var ansWrong : UIColor { UIColor(hex: 0xF14F31)}
    class var doneBtn : UIColor { UIColor(hex: 0xDADCE5)}
    class var fontGray : UIColor { UIColor(hex: 0x81848E)}
    class var D5D6D9 : UIColor { UIColor(hex: 0xD5D6D9)}
    class var E6E7E8 : UIColor { UIColor(hex: 0xE6E7E8)}
    class var photoChumbu : UIColor {UIColor(hex: 0xF2F5FF)}
}
