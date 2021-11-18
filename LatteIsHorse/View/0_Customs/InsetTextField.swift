//
//  InsetTextField.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/12.
//

import UIKit

class InsetTextField: UITextField {
    var textPadding = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 16,
            right: 0
        )

        override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }
}

