//
//  ViewController.swift
//  Kakao
//
//  Created by Fury on 06/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let friendListLabel = UILabel()
    let addingFriendVC = AddingFriendViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        addingFriendVC.delegate = self
    }
    
    @objc private func pushViewController(_ sender: Any) {
        navigationController?.pushViewController(addingFriendVC, animated: true)
    }
    
    private func viewConfiguration() {
        // NavigationController Configurations
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        title = "친구"
        
        let barButton = UIBarButtonItem(
            title: "친구추가",
            style: .done,
            target: self,
            action: #selector(pushViewController(_:))
        )
        navigationItem.rightBarButtonItem = barButton
        
        // Friends List Label
        friendListLabel.frame = CGRect(x: 50, y: 200, width: view.frame.width - 100, height: 500)
        friendListLabel.backgroundColor = .blue
        friendListLabel.text = "친구 없음"
        friendListLabel.numberOfLines = 0
        friendListLabel.textColor = .white
        friendListLabel.textAlignment = .center
        view.addSubview(friendListLabel)
    }
}

extension ViewController: AddingFriendViewcontrollerDelegate {
    func addFriend(_ name: String) {
        friendListLabel.text = ""
        let saveData = SaveData.saved
        for i in saveData.nameArr {
            friendListLabel.text! += "\(i)\n"
        }
    }
}

