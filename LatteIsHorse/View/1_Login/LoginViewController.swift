//
//  LoginViewController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit
import SnapKit
import Then

class LoginViewController: BaseViewController {
    
    let emailStartBtn = UIButton().then {
        $0.setTitle("이메일로 시작하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.Pretendard(.regular, size: 12)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        initV()
        bindConstraints()
        
        emailStartBtn.addTarget(self, action: #selector(emailTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavi()
    }
}

extension LoginViewController {
    private func setNavi() {
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.shadowColor = .clear
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
    }
    private func initV() {
        _ = [emailStartBtn].map {self.view.addSubview($0)}
    }
    private func bindConstraints() {
        emailStartBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-80)
        }
    }
}

extension LoginViewController {
    @objc func emailTapped(_ sender : UIButton) {
        //self.changeRootViewController(BaseTabBarController())

        self.navigationController?.pushViewController(JoinViewController(), animated: true)
    }
}
