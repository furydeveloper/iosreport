//
//  AddingFriendViewController.swift
//  Kakao
//
//  Created by Fury on 06/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol AddingFriendViewcontrollerDelegate: class {
    func addFriend(_ name: String) -> Void
}

class AddingFriendViewController: UIViewController {

    private let friendNameTextField = UITextField()
    private let addButton = UIButton(type: .system)
    
    weak var delegate: AddingFriendViewcontrollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            
        }
    }
    
    private func viewConfiguration() {
        title = "친구추가"
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        
        friendNameTextField.frame = CGRect(x: 100, y: 300, width: view.frame.width - 200, height: 50)
        friendNameTextField.borderStyle = .roundedRect
        friendNameTextField.textAlignment = .center
        
        addButton.frame = CGRect(x: view.center.x - 50, y: friendNameTextField.frame.maxY + 20, width: 100, height: 50)
        addButton.tintColor = .white
        addButton.backgroundColor = .gray
        addButton.setTitle("추가", for: .normal)
        addButton.addTarget(self, action: #selector(addFriendButton(_:)), for: .touchUpInside)
        
        view.addSubview(friendNameTextField)
        view.addSubview(addButton)
    }
 
    @objc func addFriendButton(_ sender: UIButton) {
        let saveData = SaveData.saved
        if friendNameTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "이름을 입력하세요", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .cancel)
            alertController.addAction(okButton)
            present(alertController, animated: true)
        } else {
            saveData.nameArr.append(friendNameTextField.text!)
            delegate?.addFriend(friendNameTextField.text!)
            print("saveData : ", saveData.nameArr as Any)
        }
    }
}
