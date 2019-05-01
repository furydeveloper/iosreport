//
//  SecondViewController.swift
//  NotificationCenterReport1
//
//  Created by Fury on 30/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

private let notiCenter = NotificationCenter.default

extension ViewController {
    static var changeBackgroundColor: Notification.Name {
        return Notification.Name("ChangeBackgroundColor")
    }
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addObserverFunc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObserverFunc()
    }
    

    private func addObserverFunc() {
        notiCenter.addObserver(
            self,
            selector: #selector(changeBackgroundColor(_:)),
            name: ViewController.changeBackgroundColor,
            object: nil
        )
    }
    
    @objc private func changeBackgroundColor(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String: UIColor] else { return }
        
        let back = userInfo["color"]!
        view.backgroundColor = back
    }
    
    deinit {
        notiCenter.removeObserver(self)
    }
}
