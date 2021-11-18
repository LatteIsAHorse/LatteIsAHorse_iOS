//
//  MQContentViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/18.
//

import UIKit

class MQContentViewController: UIViewController {
    
    let contentCV : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // 좌우 여백 없애
        layout.minimumLineSpacing = 0
        cv.backgroundColor = .none
        cv.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        cv.showsHorizontalScrollIndicator = false
        cv.collectionViewLayout = layout
        // tag
        cv.tag = 0
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .F5F6F7
    }

}
