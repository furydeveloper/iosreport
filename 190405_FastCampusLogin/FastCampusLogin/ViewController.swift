//
//  ViewController.swift
//  FastCampusLogin
//
//  Created by Fury on 05/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private let titleImageView = UIImageView()
    
    private let subTitleLayout = UIView()
    private let subTitleVIew1 = UIView()
    private let subTitleVIew2 = UIView()
    private let subTitleVIew3 = UIView()
    
    private let loginContainer = UIView()   
    
    private let emailLayout = UIView()
    private let emailImageView = UIImageView()
    private let emailTextField = UITextField()
    private let emailHiglight = UIView()
    
    private let passwordLayout = UIView()
    private let passwordImageView = UIImageView()
    private let passwordTextField = UITextField()
    private let passwordHiglight = UIView()
    
    private let joinButton = UIButton(type: .system)
    
    private let loginButton = UIButton(type: .system)
    
    private var isUp = false
    
    private let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        view.backgroundColor = .white
        viewConfiguration()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func viewConfiguration() {
        
        // Title 관련 초기화
        titleImageView.frame.size = CGSize(width: view.frame.width - 130, height: 60)
        titleImageView.center = view.center
        titleImageView.frame.origin.y = 100
        titleImageView.image = UIImage(named: "fastcampus_logo")
        view.addSubview(titleImageView)
        
        // SubTitle 관련 초기화
        subTitleVIew1.frame = CGRect(x: -15, y: 5, width: 30, height: 30)
        subTitleVIew1.backgroundColor = .red
        subTitleVIew1.layer.cornerRadius = 5
        
        subTitleVIew2.frame = CGRect(x: subTitleVIew1.frame.minX - 50, y: subTitleVIew1.frame.minY, width: 30, height: 30)
        subTitleVIew2.backgroundColor = .red
        subTitleVIew2.layer.cornerRadius = 5
        
        subTitleVIew3.frame = CGRect(x: subTitleVIew1.frame.minX + 50, y: subTitleVIew1.frame.minY, width: 30, height: 30)
        subTitleVIew3.backgroundColor = .red
        subTitleVIew3.layer.cornerRadius = 5
    
        subTitleLayout.addSubview(subTitleVIew1)
        subTitleLayout.addSubview(subTitleVIew2)
        subTitleLayout.addSubview(subTitleVIew3)
        subTitleLayout.center = view.center
        subTitleLayout.frame.origin.y = titleImageView.frame.maxY + 10
        view.addSubview(subTitleLayout)
        
        // Login 관련 초기화
        loginContainer.frame = CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 250)
        
        emailImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        emailImageView.image = UIImage.init(named: "email")
        emailTextField.frame = CGRect(x: emailImageView.frame.maxX + 30, y: 0, width: view.frame.width - (emailImageView.frame.width + 80) , height: 30)
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.becomeFirstResponder()
        emailLayout.frame = CGRect(x: 0, y: 0, width: loginContainer.frame.width, height: 40)
        emailHiglight.frame = CGRect(x: emailTextField.frame.minX, y: emailTextField.frame.maxY + 5, width: emailTextField.frame.width, height: 2)
        emailHiglight.backgroundColor = .gray
        emailLayout.addSubview(emailImageView)
        emailLayout.addSubview(emailTextField)
        emailLayout.addSubview(emailHiglight)
        
        passwordImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        passwordImageView.image = UIImage.init(named: "password")
        passwordTextField.frame = CGRect(x: passwordImageView.frame.maxX + 30, y: 0, width: view.frame.width - (passwordImageView.frame.width + 80), height: 30)
        passwordTextField.placeholder = "패스워드를 입력하세요"
        passwordLayout.frame = CGRect(x: 0, y: emailLayout.frame.maxY + 50, width: loginContainer.frame.width, height: 40)
        passwordHiglight.frame = CGRect(x: passwordTextField.frame.minX, y: passwordTextField.frame.maxY + 5, width: passwordTextField.frame.width, height: 2)
        passwordHiglight.backgroundColor = .gray
        
        passwordLayout.addSubview(passwordImageView)
        passwordLayout.addSubview(passwordTextField)
        passwordLayout.addSubview(passwordHiglight)
        
        loginButton.frame = CGRect(x: 10, y: passwordLayout.frame.maxY + 60, width: loginContainer.frame.width - 20, height: 50)
        loginButton.setTitle("Sgin In", for: .normal)
        loginButton.tintColor = .white
        loginButton.backgroundColor = .darkGray
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButton(_:)), for: .touchUpInside)
        
        joinButton.frame = CGRect(x: loginButton.frame.maxX - 80, y: passwordLayout.frame.maxY + 20, width: 100, height: 20)
        joinButton.setTitle("회원가입", for: .normal)
        joinButton.addTarget(self, action: #selector(joinButton(_:)), for: .touchUpInside)
        
        loginContainer.addSubview(joinButton)
        loginContainer.addSubview(loginButton)
        loginContainer.addSubview(emailLayout)
        loginContainer.addSubview(passwordLayout)
        
        view.addSubview(loginContainer)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.3) {
            if self.isUp == true {
                
            } else {
                self.loginContainer.frame.origin.y -= 200
                self.isUp = true
            }
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let str = textField.text! + string
        
        if str.count <= 20 {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        if self.isUp == true {
            self.loginContainer.frame.origin.y += 200
            self.isUp = false
        } else {
            
        }
        return true
    }
    
    @objc func loginButton(_ sender: UIButton) {
        // email & password Passing Logic

        if emailTextField.text!.count < 4 || emailTextField.text!.count > 16 {
            alertDialog("이메일은 4 ~ 16자 사이로 입력하세요.")
        } else if passwordTextField.text!.count < 4 || passwordTextField.text!.count > 16 {
            alertDialog("패스워드는 4 ~ 16자 사이로 입력하세요.")
        } else {
            if passwordTextField.text == ud.string(forKey: emailTextField.text!) {
                let sVC = SecondViewController()
                ud.set(true, forKey: "AutoLogin")
                print("Auto Login : ", ud.bool(forKey: "AutoLogin"))
                present(sVC, animated: true)
            } else {
                // 화면을 일시적으로 빨갛게 만들기
                alertDialog("아이디 또는 패스워드가 일치하지 않습니다.")
                view.backgroundColor = .red
             
                /*
                UIView.animate(withDuration: 4) {
                    self.view.backgroundColor = .white
                }
                */
                
                // 2초 딜레이 후 배경 변경
                let time = DispatchTime.now() + .seconds(2)
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.view.backgroundColor = .white
                }
            }
        }
    }
    
    @objc func joinButton(_ sender: UIButton) {
        let joinVC = JoinMember()
        present(joinVC, animated: true)
    }
    
    func alertDialog(_ msg: String) {
        let alertController = UIAlertController(title: "경고", message: msg, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}
