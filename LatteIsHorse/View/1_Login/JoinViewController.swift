//
//  JoinViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/12.
//

import UIKit

class JoinViewController: BaseViewController {
    
    var canChangeBtnColor : Bool = false
    
    let statusImg = UIImageView().then {
        $0.image = UIImage(named: "seq1")
    }
    
    let h1Label = UILabel().then {
        $0.text = "본인인증"
        $0.font = UIFont.StylePretendard(.h1)
    }
    
    let sub1Label = UILabel().then {
        $0.text = "본인임을 확인하기 위해 휴대폰 인증을 시작합니다.\n휴대폰 번호는 절대 외부에 공개되지 않습니다."
        $0.font = UIFont.StylePretendard(.h4)
        $0.textColor = .lhgray4
        $0.numberOfLines = 0
    }
    
    let sub2Label = UILabel().then {
        $0.text = "휴대폰 번호"
        $0.font = UIFont.StylePretendard(.sub2)
    }
    
    let phTF = InsetTextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "휴대폰 번호를 입력해주세요.",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lhgray6])
        $0.font = UIFont.Pretendard(.regular, size: 13)
        //$0.tintColor = .white
        $0.textColor = .lhgray3
        $0.isSecureTextEntry = false
        $0.keyboardType = .phonePad
        $0.tag = 0
        $0.autocapitalizationType = .none
    }
    
    let checkBtn = RoundBtn().then {
        $0.setTitle("인증번호 전송", for: .normal)
        $0.setTitleColor(.lhgray6, for: .normal)
        $0.titleLabel?.font = UIFont.Pretendard(.bold, size: 13)
        $0.backgroundColor = .F2F5F7
        $0.tag = 0
    }
    
    let sub3Label = UILabel().then {
        $0.text = "인증번호 4자리"
        $0.font = UIFont.StylePretendard(.sub2)
    }

    let codeTF = InsetTextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "인증번호 4자리를 입력해주세요",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lhgray6])
        $0.font = UIFont.Pretendard(.regular, size: 13)
        //$0.tintColor = .white
        $0.textColor = .lhgray3
        $0.isSecureTextEntry = false
        $0.keyboardType = .phonePad
        $0.tag = 0
        $0.autocapitalizationType = .none
    }
    
    let codeBtn = RoundBtn().then {
        $0.setTitle("인증하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.Pretendard(.bold, size: 13)
        $0.backgroundColor = .btnBlue
        $0.tag = 1
    }
    
    let nextBtn = UIButton().then {
        $0.setTitle("다음으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.Pretendard(.bold, size: 16)
        $0.backgroundColor = .lhgray6
        $0.tag = 2
        $0.layer.cornerRadius = 8
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "회원가입"
        initV()
        bindConstraints()
        
        phTF.delegate = self
        _ = [checkBtn,codeBtn,nextBtn].map {$0.addTarget(self, action: #selector(TappedCheck), for: .touchUpInside)}
        
        self.dismissKeyboardWhenTappedAround()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _ = [phTF,codeTF].map {$0.addBottomorTopBorder(position: .bottom, color: .E9ECF0, width: 1.0)}

    }
}

extension JoinViewController {
    private func initV() {
        _ = [statusImg,h1Label,sub1Label,sub2Label,phTF,checkBtn,sub3Label,codeTF,codeBtn,nextBtn].map {self.view.addSubview($0)}
        _ = [sub3Label, codeTF, codeBtn, nextBtn].map {$0.isHidden = true}
    }
    private func bindConstraints() {
        statusImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        h1Label.snp.makeConstraints {
            $0.top.equalTo(statusImg.snp.bottom).offset(16)
            $0.leading.equalTo(statusImg)
        }
        sub1Label.snp.makeConstraints {
            $0.top.equalTo(h1Label.snp.bottom).offset(16)
            $0.leading.equalTo(statusImg)
        }
        sub2Label.snp.makeConstraints {
            $0.top.equalTo(sub1Label.snp.bottom).offset(40)
            $0.leading.equalTo(statusImg)
        }
        phTF.snp.makeConstraints {
            $0.top.equalTo(sub2Label.snp.bottom).offset(24)
            $0.leading.equalTo(statusImg)
            $0.trailing.equalToSuperview().offset(-16)
        }
        checkBtn.snp.makeConstraints {
            $0.trailing.equalTo(phTF)
            $0.bottom.equalTo(phTF.snp.bottom).offset(-8)
            $0.width.equalToSuperview().multipliedBy(0.2613)
            $0.height.equalTo(checkBtn.snp.width).multipliedBy(0.347)
        }
        sub3Label.snp.makeConstraints {
            $0.top.equalTo(phTF.snp.bottom).offset(41)
            $0.leading.equalTo(statusImg)
        }
        codeTF.snp.makeConstraints {
            $0.top.equalTo(sub3Label.snp.bottom).offset(24)
            $0.leading.equalTo(statusImg)
            $0.trailing.equalTo(phTF)
        }
        codeBtn.snp.makeConstraints {
            $0.trailing.equalTo(phTF)
            $0.bottom.equalTo(codeTF.snp.bottom).offset(-8)
            $0.width.equalToSuperview().multipliedBy(0.2613)
            $0.height.equalTo(checkBtn.snp.width).multipliedBy(0.347)
        }
        nextBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.centerX.equalToSuperview()
            $0.leadingMargin.equalTo(16)
            $0.height.equalTo(nextBtn.snp.width).multipliedBy(0.1399)
        }
    }
}


extension JoinViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 0 {
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let count = text.count
            //print(count)
            
            if string != "" {
                if count == 4 {
                    phTF.text?.insert("-", at: String.Index.init(encodedOffset: count - 1))
                    
                    //String.Index(utf16Offset:in:)
                } else if count == 9{
                    phTF.text?.insert("-", at: String.Index.init(encodedOffset: count - 1))
                } else if count > 13{
                    return false
                }
                return true
            }
        } else if textField.tag == 1 {
            let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let count = text.count
            if count != 0 {
                nextBtn.backgroundColor = .btnBlue
            } else {
                nextBtn.backgroundColor = .lhgray6
            }
        }
        return true
    }
    
}

extension JoinViewController {
    @objc func TappedCheck(_ sender : UIButton) {
        if sender.tag == 0 {
            _ = [sub3Label, codeTF, codeBtn].map {$0.isHidden = false}
        } else if sender.tag == 1 {
            goSecond()
        } else if sender.tag == 2 {
            goPWD()
        } else if sender.tag == 3 {
            self.changeRootViewController(BaseTabBarController())
        }
    }
    
    
    private func goSecond() {
        _ = [sub3Label, codeTF, codeBtn, sub1Label, checkBtn].map {$0.isHidden = true}
        nextBtn.isHidden = false
        statusImg.image = UIImage(named: "seq2")
        h1Label.text = "기본 정보 입력"
        sub2Label.snp.remakeConstraints {
            $0.top.equalTo(h1Label.snp.bottom).offset(40)
            $0.leading.equalTo(statusImg)
        }
        sub2Label.text = "이메일"
        phTF.tag = 1
        phTF.text = ""
        phTF.attributedPlaceholder = NSAttributedString(string: "example@latte.com",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lhgray6])
        phTF.keyboardType = .emailAddress
    }
    
    private func goPWD() {
        sub2Label.text = "비밀번호"
        phTF.text = ""
        phTF.keyboardType = .asciiCapable
        phTF.isSecureTextEntry = true
        phTF.textContentType = .password
        phTF.attributedPlaceholder = NSAttributedString(string: "특수문자, 숫자, 영문 포함 8자 이상 입력해주세요.",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.lhgray6])
        nextBtn.backgroundColor = .lhgray6
        nextBtn.tag = 3
    }
}


