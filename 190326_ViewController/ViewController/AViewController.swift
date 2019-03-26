//
//  ViewController.swift
//  ViewController
//
//  Created by Fury on 26/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//
/*
 2. ViewController 데이터 전달
 > AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
 > AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가
 */

import UIKit

class AViewController: UIViewController {

    var from = ""
    var aLabel = UILabel()
    
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        button.setTitle("다음 화면", for: .normal)
        button.addTarget(self, action: #selector(goToBViewController(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        aLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        from = "0"
        aLabel.text = from
        aLabel.textAlignment = .center
        view.addSubview(aLabel)
    }
    
    @objc func goToBViewController(_ sender: UIButton) {
        let bViewController = BViewController()
        let num = Int(from)! + 1
        bViewController.from = String(num)
        present(bViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aLabel.text = self.from
    }
}

