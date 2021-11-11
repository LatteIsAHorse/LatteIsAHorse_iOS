//
//  BookMarkViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/12.
//

import UIKit

class BookMarkViewController: BaseViewController {

    var questionArr : [String] = ["샤대문에 얽힌 전설 중 답이 아닌 것은? 이거풀면 고인물 인정이다 ㄹㅇ", "설대 졸업생 중 대머리는 몇명인가?", "축제 레전드 연예인은?", "대학원은 가야하는 곳인가?"]
    
    let noLabel = UILabel().then {
        $0.text = DuplicateTexts.noQuiz
        $0.font = UIFont.Pretendard(.regular, size: 16)
        $0.textColor = .lhgray3
    }
    let bottomCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 3
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        //$0.isPagingEnabled = true
        $0.tag = 0
        $0.register(MainQuizCollectionViewCell.self, forCellWithReuseIdentifier: MainQuizCollectionViewCell.registerID)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "북마크"
        // Do any additional setup after loading the view.
        if questionArr.count == 0 {
            noLabel.isHidden = false
            bottomCV.isHidden = true
        } else {
            noLabel.isHidden = true
            bottomCV.isHidden = false
        }
        initV()
        bindConstraints()
        setCV()
    }
}

extension BookMarkViewController {
    private func initV(){
        _ = [noLabel, bottomCV].map {self.view.addSubview($0)}
    }
    private func bindConstraints() {
        noLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        bottomCV.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.topMargin.equalTo(32)
            $0.leadingMargin.equalTo(0)
        }
    }
    private func setCV() {
        bottomCV.delegate = self
        bottomCV.dataSource = self
    }
}

extension BookMarkViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()

            guard let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainQuizCollectionViewCell.registerID, for: indexPath) as? MainQuizCollectionViewCell else {
                return UICollectionViewCell()
            }
            firstCell.imgView.image = UIImage(named: "testIMG")
            firstCell.questionLabel.text = questionArr[indexPath.row]
            firstCell.gradeView.rightLabel.text = "닉네임\(indexPath.row)"
            firstCell.seeView.rightLabel.text = "2000"
            firstCell.ddabongView.rightLabel.text = "3000"
            cell = firstCell
        
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

extension BookMarkViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()

            let c_width = (collectionView.frame.width-16) / 2
        let c_height = c_width * 1.37
            let c_size = CGSize(width: c_width, height: c_height)
            size = c_size
        
        return size
        
    }
}
