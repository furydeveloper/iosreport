//
//  ViewController.swift
//  UISwitch
//
//  Created by Fury on 22/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//
// UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showBool: UILabel!
    @IBOutlet var uiSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        uiSwitch.addTarget(self, action: #selector(switchChange(_:)), for: .valueChanged)
        
        switchChange(uiSwitch)
    }
    
    @objc func switchChange(_ sender: UISwitch) {
        if sender.isOn {
            showBool.text = "On"
        } else {
            showBool.text = "Off"
        }
    }
}

