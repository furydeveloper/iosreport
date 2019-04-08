//
//  JoinMember.swift
//  FastCampusLogin
//
//  Created by Fury on 06/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class JoinMember: UIViewController {
    
    private let titleLabel = UILabel()

    private let joinEmailLabel = UILabel()
    private let joinEmailTextField = UITextField()
    
    private let joinPasswordLabel = UILabel()
    private let joinPasswordTextField = UITextField()
    
    private let joinButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)
    
    private let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        viewConfiguration()
    }
    
    private func viewConfiguration() {
        titleLabel.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
        titleLabel.text = "회원가입"
        titleLabel.textAlignment = .center

        joinEmailLabel.frame = CGRect(x: 20, y: 150, width: 80, height: 30)
        joinEmailLabel.text = "E-Mail"
        joinEmailLabel.textAlignment = .center
        
        joinEmailTextField.frame = CGRect(x: joinEmailLabel.frame.maxX + 10, y: joinEmailLabel.frame.minY, width: view.frame.width - joinEmailLabel.frame.width - 40, height: 30)
        joinEmailTextField.placeholder = "이메일을 입력하세요."
        joinEmailTextField.becomeFirstResponder()
        
        joinPasswordLabel.frame = CGRect(x: 20, y: joinEmailLabel.frame.maxY + 30, width: 80, height: 30)
        joinPasswordLabel.text = "PassWord"
        joinPasswordLabel.textAlignment = .center
        
        joinPasswordTextField.frame = CGRect(x: joinPasswordLabel.frame.maxX + 10, y: joinPasswordLabel.frame.minY, width: view.frame.width - joinPasswordLabel.frame.width - 40, height: 30)
        joinPasswordTextField.placeholder = "패스워드를 입력하세요."
        
        joinButton.frame = CGRect(x: 20, y: joinPasswordLabel.frame.maxY + 30, width: (view.frame.width / 2) - 40, height: 30)
        joinButton.setTitle("회원가입", for: .normal)
        joinButton.addTarget(self, action: #selector(joinButton(_:)), for: .touchUpInside)
        
        cancelButton.frame = CGRect(x: joinButton.frame.maxX + 20, y: joinButton.frame.minY, width: (view.frame.width / 2) - 40, height: 30)
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButton(_:)), for: .touchUpInside)

        view.addSubview(titleLabel)
        
        view.addSubview(joinEmailTextField)
        view.addSubview(joinPasswordTextField)
        view.addSubview(joinEmailLabel)
        view.addSubview(joinPasswordLabel)
        
        view.addSubview(joinButton)
        view.addSubview(cancelButton)
    }
    
    @objc func joinButton(_ sender: UIButton) {
        
        if joinEmailTextField.text!.count < 4 || joinEmailTextField.text!.count > 16 {
            alertDialog("이메일은 4 ~ 16자 사이로 입력하세요.")
        } else if joinPasswordTextField.text!.count < 4 || joinPasswordTextField.text!.count > 16 {
            alertDialog("패스워드는 4 ~ 16자 사이로 입력하세요.")
        } else {
            if ud.string(forKey: joinEmailTextField.text!) != nil {
                alertDialog("이미 존재하는 아이디 입니다.")
            } else {
                ud.set(joinPasswordTextField.text!, forKey: joinEmailTextField.text!)
                dismiss(animated: true)
            }
        }
        
    }

    @objc func cancelButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func alertDialog(_ msg: String) {
        let alertController = UIAlertController(title: "경고", message: msg, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}
