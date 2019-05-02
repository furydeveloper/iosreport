//
//  ViewController.swift
//  NotificationCenterReport2
//
//  Created by Fury on 01/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let notiCenter = NotificationCenter.default
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubView()
        autoLayout()
    }

    private func configure() {
        textField.borderStyle = .bezel
        textField.textAlignment = .center
        textField.delegate = self
    }
    
    private func addSubView() {
        view.addSubview(textField)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100),
            textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 60),
            ])
    }
}

extension ViewController: UITextFieldDelegate {
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        notiCenter.post(
            name: SecondViewController.changeTextLabel,
            object: nil,
            userInfo: ["text": textField.text!]
        )
        return true
    }
}
