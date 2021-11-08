//
//  MakeQuizViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/08.
//

import UIKit
import Photos

class MakeQuizViewController: BaseViewController {
    
    var albumAuth : Int = Int()
    
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    let contentView = UIView()
    
    let titleLabel = UILabel().then {
        $0.text = "퀴즈 제목"
        $0.textColor = .black
        $0.font = UIFont.Pretendard(.bold, size: 16)
    }
    
    let subLabel = UILabel().then {
        $0.text = QuizMain.subText
        $0.textColor = .fontGray
        $0.font = UIFont.Pretendard(.bold, size: 14)
    }
    
    let textView = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth  = 1.0
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.E6E7E8.cgColor
        $0.textColor = .lightGray
        $0.tag = 0
        $0.text = QuizMain.quizTitleInput
        $0.isScrollEnabled = false
        $0.font = UIFont.Pretendard(.regular, size: 14)
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    let chumbuView = UIView().then {
        $0.backgroundColor = .photoChumbu
        $0.layer.cornerRadius = 8
    }
    
    let ansLabel = UILabel().then {
        $0.text = "퀴즈 답안"
        $0.textColor = .black
        $0.font = UIFont.Pretendard(.bold, size: 16)
    }
    
    let ansView1 = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth  = 1.0
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.E6E7E8.cgColor
        $0.textColor = .lightGray
        $0.tag = 1
        $0.text = "\($0.tag)\(QuizMain.quizSelect)"
        $0.isScrollEnabled = false
        $0.font = UIFont.Pretendard(.regular, size: 14)
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    let ansView2 = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth  = 1.0
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.E6E7E8.cgColor
        $0.textColor = .lightGray
        $0.tag = 2
        $0.text = "\($0.tag)\(QuizMain.quizSelect)"
        $0.isScrollEnabled = false
        $0.font = UIFont.Pretendard(.regular, size: 14)
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    let ansView3 = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth  = 1.0
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.E6E7E8.cgColor
        $0.textColor = .lightGray
        $0.tag = 3
        $0.text = "\($0.tag)\(QuizMain.quizSelect)"
        $0.isScrollEnabled = false
        $0.font = UIFont.Pretendard(.regular, size: 14)
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    let ansView4 = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth  = 1.0
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.E6E7E8.cgColor
        $0.textColor = .lightGray
        $0.tag = 4
        $0.text = "\($0.tag)\(QuizMain.quizSelect)"
        $0.isScrollEnabled = false
        $0.font = UIFont.Pretendard(.regular, size: 14)
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    let makeBtn = UIButton().then {
        $0.setTitle("퀴즈 만들기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.Pretendard(.bold, size: 16)
        $0.backgroundColor = .btnBlue
        $0.layer.cornerRadius = 8
        
    }
    
    let chumbuLabel = UILabel().then {
        $0.text = "사진 첨부하기"
        $0.textColor = .black
        $0.font = UIFont.Pretendard(.bold, size: 14)
    }
    
    let chumbuBtn = UIButton().then {
        $0.setTitle("", for: .normal)
        //        $0.tintColor = .chumbuBlue
        //        let image = UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate)
        $0.setImage(UIImage(named: "add"), for: .normal)
    }
    
    let chumbuLimitLabel = UILabel().then {
        $0.text = QuizMain.fileLimit
        $0.textColor = .systemGray2
        $0.numberOfLines = 0
        $0.textAlignment  = .center
        $0.font = UIFont.Pretendard(.regular, size: 12)
    }
    
    let loadIV = UIImageView().then {
        $0.isUserInteractionEnabled = true
    }
    
    let imgPicker = UIImagePickerController().then {
        $0.allowsEditing = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "퀴즈 만들기"
        
        // 라떼 지급 안내 팝업
        let popupVC = PopupDarkViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        let popup = setPopUp()
        popupVC.popupView = popup
        popupVC.canTouch = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.present(popupVC, animated: false, completion: nil)
        }
        
        initV()
        bindConstraints()
        
        self.dismissKeyboardWhenTappedAround()
        
        _ = [textView, ansView1, ansView2, ansView3, ansView4].map {$0.delegate = self}
        imgPicker.delegate = self
        
        chumbuBtn.addTarget(self, action: #selector(chumbuTapped), for: .touchUpInside)

        loadIV.isHidden = true
        reloadImg(selectedview : loadIV)
    }
    
}

extension MakeQuizViewController {
    private func setPopUp() ->  QuizPopUpView {
        let correctPopUP = QuizPopUpView()
        correctPopUP.logoIV.image = nil
        correctPopUP.label1.text = "알려드릴게요"
        correctPopUP.label2.text = "우리학교에 관련된 퀴즈를 만들고 나만의 라떼력을 뽐내 보세요.\n\n퀴즈를 만들면 1 라떼 포인트를 지급해 드립니다."
        correctPopUP.checkBtn.tag = 0
        correctPopUP.checkBtn.addTarget(self, action: #selector(okTapped), for: .touchUpInside)
        return correctPopUP
        
    }
    @objc func okTapped(_sender : UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

extension MakeQuizViewController {
    private func initV() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        _ = [titleLabel,subLabel,textView,chumbuView,ansLabel,ansView1,ansView2,ansView3,ansView4,makeBtn].map {self.contentView.addSubview($0)}
        _ = [chumbuLabel,chumbuBtn,chumbuLimitLabel,loadIV].map {self.chumbuView.addSubview($0)}
    }
    private func bindConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(12)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel)
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leadingMargin.equalTo(16)
            //$0.bottom.equalToSuperview().offset(-552)
            //$0.height.equalTo(textView.snp.width).multipliedBy(0.122)
            $0.height.greaterThanOrEqualTo(textView.snp.width).multipliedBy(0.122)
        }
        chumbuView.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leadingMargin.equalTo(16)
            $0.height.equalTo(chumbuView.snp.width).multipliedBy(0.658)
        }
        chumbuLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        chumbuBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(chumbuLabel.snp.top).offset(-20)
            $0.width.equalToSuperview().multipliedBy(0.152)
        }
        chumbuLimitLabel.snp.makeConstraints {
            $0.top.equalTo(chumbuLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        loadIV.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leadingMargin.equalTo(22.5)
            $0.topMargin.equalTo(28)
        }
        ansLabel.snp.makeConstraints {
            $0.top.equalTo(chumbuView.snp.bottom).offset(32)
            $0.leading.equalTo(titleLabel)
        }
        ansView1.snp.makeConstraints {
            $0.top.equalTo(ansLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalToSuperview().multipliedBy(0.792)
            $0.height.greaterThanOrEqualTo(ansView1.snp.width).multipliedBy(0.1414)
        }
        ansView2.snp.makeConstraints {
            $0.top.equalTo(ansView1.snp.bottom).offset(12)
            $0.leading.equalTo(ansView1)
            $0.width.equalTo(ansView1)
            $0.height.greaterThanOrEqualTo(ansView2.snp.width).multipliedBy(0.1414)
        }
        ansView3.snp.makeConstraints {
            $0.top.equalTo(ansView2.snp.bottom).offset(12)
            $0.leading.equalTo(ansView1)
            $0.width.equalTo(ansView1)
            $0.height.greaterThanOrEqualTo(ansView3.snp.width).multipliedBy(0.1414)
        }
        ansView4.snp.makeConstraints {
            $0.top.equalTo(ansView3.snp.bottom).offset(12)
            $0.leading.equalTo(ansView1)
            $0.width.equalTo(ansView1)
            $0.height.greaterThanOrEqualTo(ansView4.snp.width).multipliedBy(0.1414)
        }
        makeBtn.snp.makeConstraints {
            $0.top.equalTo(ansView4.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(textView)
            $0.height.equalTo(makeBtn.snp.width).multipliedBy(0.1399)
            $0.bottom.equalToSuperview()
        }
    }
}


extension MakeQuizViewController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = UIColor.lightGray
            if textView.tag == 0 {
                textView.text = QuizMain.quizTitleInput
            } else {
                textView.text = "\(textView.tag)\(QuizMain.quizSelect)"
            }
            
        }
    }
}

extension MakeQuizViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openAlbum() {
        self.imgPicker.sourceType = .photoLibrary
        present(self.imgPicker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
            loadIV.isHidden = false
            print("이미지수정")
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
            print("이미지원본")
            loadIV.isHidden = false
        } else {
            loadIV.isHidden = true
            print("error")
        }
        self.loadIV.image = newImage // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
    @objc func chumbuTapped(_ sender : UIButton) {
        checkAlbumPermission()
        if self.albumAuth == 1 {
            openAlbum()
        }
    }
}

extension MakeQuizViewController {
    
    func checkAlbumPermission(){
        PHPhotoLibrary.requestAuthorization( { status in
            switch status{
            case .authorized:
                print("Album: 권한 허용")
                self.albumAuth = 1
            case .denied:
                print("Album: 권한 거부")
                self.albumAuth = 0
            case .restricted, .notDetermined:
                print("Album: 선택하지 않음")
                self.albumAuth = 0
            default:
                break
            }
        })
    }
}


extension MakeQuizViewController {
    func reloadImg(selectedview : UIView) {
            let touchDown = UITapGestureRecognizer(target:self, action: #selector(didTouchDown))
            selectedview.addGestureRecognizer(touchDown)
    }
    
    @objc func didTouchDown(gesture : UITapGestureRecognizer){
        openAlbum()
    }
}
