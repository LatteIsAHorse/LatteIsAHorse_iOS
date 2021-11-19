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
        layout.minimumLineSpacing = 8
        cv.backgroundColor = .F5F6F7
        cv.contentInset = UIEdgeInsets.init(top: 16, left: 0, bottom: 16, right: 0)
        cv.showsHorizontalScrollIndicator = false
        cv.collectionViewLayout = layout
        // tag
        cv.tag = 0
        cv.register(NewMainQuizCollectionViewCell.self, forCellWithReuseIdentifier: NewMainQuizCollectionViewCell.registerID)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .F5F6F7
        initV()
        bindConstraints()
        setCV()
        
        QuizListDataManager().getQuizList(viewController: self)
    }

}

extension MQContentViewController {
    func setCV(){
        contentCV.delegate = self
        contentCV.dataSource = self
    }
    func initV() {
        self.view.addSubview(contentCV)
    }
    func bindConstraints(){
        contentCV.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MQContentViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewMainQuizCollectionViewCell.registerID, for: indexPath) as? NewMainQuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        contentCell.questionLabel.text = "ddddddddddddddddddddddddddddd"
        cell = contentCell
        return cell
    }
}

extension MQContentViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.cellForItem(at: indexPath)
        let width = collectionView.frame.width - 32
        let height = width * 0.57
        return CGSize(width: width, height: height)
    }
}

extension MQContentViewController {
    func didRetrieveBoxOffice(result : QuizListResponse) {
        print(result.data)
    }
    
    func failedToRequest(message : String) {
        self.presentAlert(title: message)
    }
}
