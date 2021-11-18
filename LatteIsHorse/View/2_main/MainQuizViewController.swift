//
//  MainQuizViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit

class MainQuizViewController: BaseViewController {
    
    let screenHeight = UIScreen.main.bounds.size.height
    
    let univName : String = "서울대학교"
    
    let tabArr = ["전체보기","자유주제","코로나","대학문화","시험꿀팁","연예"]
    
    var scrollIdx = 0
    
    let tabCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 좌우 여백 없애
        layout.minimumLineSpacing = 20
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.translatesAutoresizingMaskIntoConstraints = false
        // tag
        $0.tag = 0
    }
    
    let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavi()
        initV()
        bindConstraints()
        setCV()
        addRightBarButton()

    }
}

extension MainQuizViewController {
    private func setNavi() {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.Pretendard(.semiBold, size: 20)
        label.text = self.univName
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    private func addRightBarButton() {
        let btnbookmark = UIButton.init(type: .custom)
        btnbookmark.setImage(UIImage(named: "bookmark"), for: .normal)
        btnbookmark.addTarget(self, action: #selector(naviTapped(_:)), for: .touchUpInside)
        btnbookmark.tag = 0
        
        let btnalarm = UIButton.init(type: .custom)
        btnalarm.setImage(UIImage(named: "alarm"), for: .normal)
        btnalarm.addTarget(self, action: #selector(naviTapped(_:)), for: .touchUpInside)
        btnalarm.tag = 1

        let stackview = UIStackView.init(arrangedSubviews: [btnbookmark, btnalarm])
        stackview.distribution = .equalSpacing
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.spacing = 8
        
        let rightBarButton = UIBarButtonItem(customView: stackview)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    private func initV(){
        self.view.addSubview(tabCV)
    }
    private func bindConstraints(){
        NSLayoutConstraint.activate([
            tabCV.topAnchor.constraint(equalTo: self.view.topAnchor),
            tabCV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabCV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabCV.heightAnchor.constraint(equalToConstant: 45)
        ])
//        tabCV.snp.makeConstraints {
//            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(45)
//        }
    }
    private func setCV() {
        self.tabCV.delegate = self
        self.tabCV.dataSource = self
        tabCV.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.registerID)
        
    }
}



extension MainQuizViewController {
    @objc func makeTapped(_sender : UIButton) {
        let nextVC = MakeQuizViewController()
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func naviTapped(_ sender : UIButton) {
        if sender.tag == 0 {
            let nextVC = BookMarkViewController()
            nextVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(nextVC, animated: false)
        }
    }
    
}

extension MainQuizViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if collectionView.tag == 0 {
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.registerID, for: indexPath) as? TabCollectionViewCell else {
                return UICollectionViewCell()
            }
            tabCell.tabLabel.text = tabArr[indexPath.row]
            if indexPath.item == 0 {
                tabCell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
            }
            cell = tabCell
            
        }
        return cell
    }
    
}

extension MainQuizViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // MARK: tag 크기에 맞게 cell size
        let item = tabArr[indexPath.row]
        //UIFont.systemFont(ofSize: 14, weight: .bold)
        //let width = item.size(withAttributes: [NSAttributedString.Key.font : UIFont.Pretendard(.regular, size: 14)]).width + 10
        let width = collectionView.frame.width / 6
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
    }
}
