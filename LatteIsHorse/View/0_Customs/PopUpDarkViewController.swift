//
//  PopUpDarkViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

class PopupDarkViewController: UIViewController {
    
    
    lazy var popupView = UIView()
    var canTouch : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        //그냥 알파넣으면 다 투명해짐
        self.view.backgroundColor = .black.withAlphaComponent(0.7)
        // Do any additional setup after loading the view.
        
        
        initVC()
        
        bindConstraints()

        
        if canTouch {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(_:)))
            self.view.addGestureRecognizer(gesture)
        }
    }
    
    
}

extension PopupDarkViewController {
    private func initVC(){
        self.view.addSubview(popupView)
    }
    private func bindConstraints(){

        popupView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
       
    }
    @objc func viewTapped(_ sender:UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
}
