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
    
    var questionArr : [String] = ["샤대문에 얽힌 전설 중 답이 아닌 것은? 이거풀면 고인물 인정이다 ㄹㅇ", "설대 졸업생 중 대머리는 몇명인가?"]
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = .mainBG
    }
    
    let topView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let topTitleLabel = UILabel().then {
        $0.text = "반응 핫한 퀴즈 🔥"
        $0.font = UIFont.Pretendard(.extraBold, size: 18)
    }
    
    let topCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        //$0.isPagingEnabled = true
        $0.tag = 0
        $0.register(MainQuizCollectionViewCell.self, forCellWithReuseIdentifier: MainQuizCollectionViewCell.registerID)
        
    }
    
    let quizBtn = UIButton().then {
//        $0.setTitle("퀴즈만들기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.titleLabel?.font = UIFont.Pretendard(.bold, size: 14)
        $0.backgroundColor = .btnBlue
        $0.layer.cornerRadius = 21
        
        // 그림자 생성
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowRadius = 4
    }
    
    let btnContent = LeftImgRightLabelView().then {
        $0.isUserInteractionEnabled = false
        $0.leftImgView.image = UIImage(named: "iconForBtn")
        $0.leftImgView.contentMode = .scaleAspectFit
        $0.rightLabel.text = "  퀴즈만들기"
        $0.rightLabel.textColor = .white
        $0.rightLabel.font = UIFont.Pretendard(.bold, size: 14)
    }

    
    let bottomView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let bottomCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        //$0.isPagingEnabled = true
        $0.tag = 1
        $0.register(MainQuizCollectionViewCell.self, forCellWithReuseIdentifier: MainQuizCollectionViewCell.registerID)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavi()
        initV()
        bindConstraints()
        setCV()
        
        quizBtn.addTarget(self, action: #selector(makeTapped), for: .touchUpInside)
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
    private func initV(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        _ = [topView, bottomView,quizBtn].map {self.contentView.addSubview($0)}
        _ = [topTitleLabel, topCV].map {self.topView.addSubview($0)}
        bottomView.addSubview(bottomCV)
        quizBtn.addSubview(btnContent)

    }
    private func bindConstraints(){
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenHeight * 1.226 * 0.322)
        }
        topTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        topCV.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(topTitleLabel.snp.bottom).offset(16)
        }
        bottomView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenHeight * 1.226 * 0.478)
            $0.bottom.equalToSuperview()
        }
        bottomCV.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leadingMargin.equalToSuperview().offset(24)
            $0.topMargin.equalToSuperview().offset(16)
        }
        quizBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.view.snp.bottom).offset(-20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.352)
            $0.height.equalTo(quizBtn.snp.width).multipliedBy(0.318)
        }
        btnContent.leftImgView.snp.makeConstraints {
            $0.height.equalTo(quizBtn).multipliedBy(0.5)
            $0.width.equalTo(btnContent.leftImgView.snp.height)
        }
        btnContent.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    private func setCV() {
        _ = [topCV,bottomCV].map {$0.delegate = self;$0.dataSource = self}
    }
}

extension MainQuizViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if collectionView.tag == 0 {
            guard let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainQuizCollectionViewCell.registerID, for: indexPath) as? MainQuizCollectionViewCell else {
                return UICollectionViewCell()
            }
            firstCell.imgView.image = UIImage(named: "testIMG")
            firstCell.questionLabel.text = questionArr[indexPath.row]
            firstCell.gradeView.rightLabel.text = "닉네임\(indexPath.row)"
            firstCell.seeView.rightLabel.text = "2000"
            firstCell.ddabongView.rightLabel.text = "3000"
            cell = firstCell
        } else if collectionView.tag == 1 {
            guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainQuizCollectionViewCell.registerID, for: indexPath) as? MainQuizCollectionViewCell else {
                return UICollectionViewCell()
            }
            secondCell.imgView.image = UIImage(named: "testIMG")
            secondCell.questionLabel.text = "질문\(indexPath.row)"
            secondCell.gradeView.rightLabel.text = "닉네임\(indexPath.row)"
            secondCell.seeView.rightLabel.text = "2000"
            secondCell.ddabongView.rightLabel.text = "3000"
            cell = secondCell
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = SolveQuizViewController()
        if collectionView.tag == 0 {
            // tabBar 숨기기
            nextVC.hidesBottomBarWhenPushed = true
            nextVC.questionLabel.text =  questionArr[indexPath.row]
            nextVC.ans1.ansLabel.text = "보기1보기1보기1보기1보기1보기1보기1보기1보기1보기1보기1"
            nextVC.ans2.ansLabel.text = "보기2"
            nextVC.ans3.ansLabel.text = "보기3"
            nextVC.ans4.ansLabel.text = "보기4"
            nextVC.ans = indexPath.row
            self.navigationController?.pushViewController(nextVC, animated: false)
        }
    }
}

extension MainQuizViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        if collectionView.tag == 0 {
            let c_width = collectionView.frame.width * 0.57
            let c_height = c_width * 1.107
            let c_size = CGSize(width: c_width, height: c_height)
                size = c_size
        } else if collectionView.tag == 1 {
            let c_width = (collectionView.frame.width - 24) / 2
            let c_height = (collectionView.frame.height) / 2
            let c_size = CGSize(width: c_width, height: c_height)
                size = c_size
        }
        return size
        
    }
}

extension MainQuizViewController {
    @objc func makeTapped(_sender : UIButton) {
        let nextVC = MakeQuizViewController()
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
