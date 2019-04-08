//
//  SecondViewController.swift
//  FastCampusLogin
//
//  Created by Fury on 05/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let myNameLable = UILabel()
    private let backButton = UIButton(type: .system)
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        viewConfiguration()
    }
    
    private func viewConfiguration() {
        backButton.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 40)
        backButton.setTitle("뒤로가기", for: .normal)
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        
        view.addSubview(backButton)
    }

    
    @objc func backButton(_ sender: UIButton) {
        ud.set(false, forKey: "AutoLogin")
        print("Auto Login : ", ud.bool(forKey: "AutoLogin"))
        if let presentVC = self.presentingViewController {
            dismiss(animated: true)
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let fVC = ViewController()
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = fVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }
}
