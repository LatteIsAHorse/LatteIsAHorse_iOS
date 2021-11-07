//
//  BaseViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font : UIFont.Pretendard(.bold, size: 16)
        ]
        
        // Background Color
        self.view.backgroundColor = .white
        
        // setNAVII
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        
        //Fix Nav Bar tint issue in iOS 15.0 or later - is transparent w/o code below
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            let navigationBar = UINavigationBar()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, .font  : UIFont.Pretendard(.regular, size: 16) ]
            appearance.backgroundColor = .white
            //appearance.shadowColor = nil
            //UINavigationBar.appearance().standardAppearance = appearance;
            //UINavigationBar.appearance().scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }

    }
}
