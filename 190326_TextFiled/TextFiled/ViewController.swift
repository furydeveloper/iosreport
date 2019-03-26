//
//  ViewController.swift
//  TextFiled
//
//  Created by Fury on 26/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

/*
1. 영상 참고
> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20
*/

import UIKit

class ViewController: UIViewController {

    var displayLabel = UILabel()
    var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        displayLabel.textAlignment = .center
        displayLabel.text = ""
        view.addSubview(displayLabel)
        
        textField.addTarget(self, action: #selector(textFieldEditChanged(_:)), for: .editingChanged)
        
        textField.addTarget(self, action: #selector(textFieldonExit(_:)), for: .editingDidEndOnExit)
        
        textField.addTarget(self, action: #selector(textFieldEditDidBegin(_:)), for: .editingDidBegin)
        
        textField.frame = CGRect(x: 30, y: 300, width: view.frame.width - 60, height: 50)
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
    }
    
    @IBAction func textFieldEditDidBegin(_ sender: UITextField) {
        displayLabel.textColor = .blue
        displayLabel.font = UIFont.systemFont(ofSize: 40)
    }
    
    
    @IBAction func textFieldEditChanged(_ sender: UITextField) {
        guard let inputText = sender.text else {
            return
        }
        displayLabel.text = inputText
    }
    
    @IBAction func textFieldonExit(_ sender: UITextField) {
        displayLabel.textColor = .red
        displayLabel.font = UIFont.systemFont(ofSize: 20)
    }
}

