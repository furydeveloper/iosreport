//
//  SecondViewController.swift
//  SecondReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    private let backButton = UIButton(type: .system)
    private let backColor = BackgroundSingleton.color
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
        print("backColor Red : ", backColor.red!)
        print("backColor Green : ", backColor.green!)
        print("backColor Blue : ", backColor.blue!)
        print(UIColor.red)
        
        view.backgroundColor = UIColor(red: backColor.red!, green: backColor.green!, blue: backColor.blue!, alpha: 1)
    }
    
    private func configuration() {
        backButton.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: 40)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
