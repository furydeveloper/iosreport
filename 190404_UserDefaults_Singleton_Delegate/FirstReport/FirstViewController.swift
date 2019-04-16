//
//  ViewController.swift
//  FirstReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//


/*
 1.
 FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
 - UserDefaults 를 이용한 방법으로 구현
 - Singleton 을 이용한 방법으로 구현
 - Delegate 를 이용한 방법으로 구현
 */


import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func userDefaultBtn(_ sender: UIButton) {
        //userDefaultsMethods()
        //singletonMethods()
        goToSVC()
    }
    
    private func userDefaultsMethods() {
        guard let text = textField.text else { return }
        ud.set(text, forKey: "text")
    }
    
    private func singletonMethods() {
        let saveData = SaveDataSingleton.shared
        guard let text = textField.text else { return }
        saveData.str = text
    }
    
    private func goToSVC() {
        let sVC = self.storyboard!.instantiateViewController(withIdentifier: "sVC")
        (sVC as? SecondViewController)?.delegate = self
        present(sVC, animated: true)
    }
    
}

extension FirstViewController: SecondViewControllerDelegate {
    func changeLable(_ label: UILabel?) {
        guard let text = textField.text else { return }
        label?.text = text
    }
}

