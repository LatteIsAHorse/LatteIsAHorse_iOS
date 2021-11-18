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
    
    var tapCnt = 0
    
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
       $0.bounces = false
    }
    
    let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.bounces = false
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavi()
        initV()
        bindConstraints()
        setCV()
        addRightBarButton()
        addContainVC()

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
        _ = [tabCV, scrollView].map {self.view.addSubview($0)}
        
        scrollView.delegate = self
        self.scrollView.contentSize.width = self.view.frame.width * CGFloat(tabArr.count)
    }
    private func bindConstraints(){
        NSLayoutConstraint.activate([
            tabCV.topAnchor.constraint(equalTo: self.view.topAnchor),
            tabCV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabCV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabCV.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(tabCV.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            //$0.width.equalTo(self.view.frame.width * 3)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        } else if indexPath.row == 1 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width , y: 0), animated: true)
        } else if indexPath.row == 2 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width*2 , y: 0), animated: true)
        } else if indexPath.row == 3 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width*3 , y: 0), animated: true)
        } else if indexPath.row == 4 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width*4 , y: 0), animated: true)
        } else if indexPath.row == 5 {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width*5 , y: 0), animated: true)
        }
    }
    
    // MARK: 스크롤뷰 페이징 인덱스
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print("END Scrolling \(scrollView.contentOffset.x / scrollView.bounds.size.width)")
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        scrollIdx = index
        //print("index : \(index)")
        let indexPath = IndexPath(item: index, section: 0)
        tabCV.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        collectionView(tabCV, didSelectItemAt: indexPath)
        
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


extension MainQuizViewController {
    func addContainVC(){
        // Left View Controller 생성
        let leftVC = MQContentViewController()
        // Left View Controller를 Child View Controller로 지정
        self.addChild(leftVC)
        // Left View Controller의 View만 가져오기
        guard let leftVCView = leftVC.view else { return }
        // Left View Controller View의 Frame 지정
        leftVCView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        // Scroll View에 Left View Controller의 View 넣기
        self.scrollView.addSubview(leftVCView)
        // 이제 Left View Controller가 Container View Controller 앞으로 올라왔기 때문에 didmove(toParent:)를 실행
        leftVC.didMove(toParent: self)
        
        
        
        
        // Right View Controller도 동일.
        let rightVC = MQContentViewController()
        self.addChild(rightVC)
        guard let rightVCView = rightVC.view else { return }
        //print("rerer:\(self.view.frame.width)")
        rightVCView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(rightVCView)
        rightVC.didMove(toParent: self)
     
        
        
        // Right View Controller도 동일.
        let thirdVC = MQContentViewController()
        self.addChild(thirdVC)
        guard let thirdVCView = thirdVC.view else { return }
        thirdVCView.frame = CGRect(x: self.view.frame.width*2, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(thirdVCView)
        thirdVC.didMove(toParent: self)
 
        
        // Right View Controller도 동일.
        let fourthVC = MQContentViewController()
        self.addChild(fourthVC)
        guard let fourthVCView = fourthVC.view else { return }
        fourthVCView.frame = CGRect(x: self.view.frame.width*3, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(fourthVCView)
        fourthVC.didMove(toParent: self)
  
        
        // Right View Controller도 동일.
        let fifthVC = MQContentViewController()
        self.addChild(fifthVC)
        guard let fifthVCView = fifthVC.view else { return }
        fifthVCView.frame = CGRect(x: self.view.frame.width*4, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(fifthVCView)
        fifthVC.didMove(toParent: self)
    
        
        // Right View Controller도 동일.
        let sixthVC = MQContentViewController()
        self.addChild(sixthVC)
        guard let sixthVCView = sixthVC.view else { return }
        sixthVCView.frame = CGRect(x: self.view.frame.width*5, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        self.scrollView.addSubview(sixthVCView)
        sixthVC.didMove(toParent: self)

    }
}


