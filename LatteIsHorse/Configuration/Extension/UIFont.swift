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
}
