//
//  UIFont.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import Foundation
import UIKit

extension UIFont {
    public enum PretendardType : String {
        case regular = "Regular"
        case thin = "Thin"
        case extraLight = "ExtraLight"
        case light = "Light"
        case medium = "Medium"
        case semiBold = "SemiBold"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case black = "Black"
    }
    
    static func Pretendard(_ type : PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
    
    public enum PretendardStyle : String {
        case h1 = "Bold 18"
        case h2 = "Bold 16"
        case h3 = "Bold 13"
        case h4 = "Regular 15"
        case sub2 = "Medium 16"
    }
    
    static func StylePretendard(_ style : PretendardStyle) -> UIFont {
        let strArr = style.rawValue.components(separatedBy: " ")
        let tmp_size : String = strArr[1]
        let real_size = CGFloat((tmp_size as NSString).floatValue)
        return UIFont(name: "Pretendard-\(strArr[0])", size: real_size)!
    }
}
