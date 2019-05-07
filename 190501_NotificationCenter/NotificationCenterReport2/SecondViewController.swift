//
//  SecondViewController.swift
//  NotificationCenterReport2
//
//  Created by Fury on 01/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension SecondViewController {
    static var changeTextLabel: Notification.Name {
        return Notification.Name("changeTextLabel")
    }
}

class SecondViewController: UIViewController {

    let notiCenter = NotificationCenter.default
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        
        addObserve()
        configuration()
        addSubView()
        autoLayout()
    }
    
    private func addObserve() {
        notiCenter.addObserver(
            self,
            selector: #selector(changeTextLabel(_:)),
            name: SecondViewController.changeTextLabel,
            object: nil
        )
    }
    
    @objc private func changeTextLabel(_ sender: Notification) {
        guard let textValue = sender.userInfo as? [String: String] else { return }
        textLabel.text = textValue["text"]
    }
    
    private func configuration() {
        textLabel.textAlignment = .center
    }
    
    private func addSubView() {
        view.addSubview(textLabel)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 80),
            ])
    }
    
    deinit {
        notiCenter.removeObserver(self)
    }
}
