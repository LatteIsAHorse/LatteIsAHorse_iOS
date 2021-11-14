//
//  TextViewWithPlaceholder.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/08.
//

import UIKit

class TextViewWithPlaceholder: UITextView {
    
    override init(frame : CGRect, textContainer: NSTextContainer?) {
        super.init(frame: CGRect.zero, textContainer: nil)
        self.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        self.delegate = self
    }
}

extension TextViewWithPlaceholder : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
      if textView.textColor == UIColor.lightGray {
        textView.text = nil
        textView.textColor = UIColor.black
      }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
      if textView.text.isEmpty {
        textView.text = "내용을 입력해주세요."
        textView.textColor = UIColor.lightGray
      }
    }
}
