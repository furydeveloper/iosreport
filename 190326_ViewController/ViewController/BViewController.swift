//
//  BViewController.swift
//  ViewController
//
//  Created by Fury on 26/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    var from = ""
    var aLabel = UILabel()
    
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        button.setTitle("이전 화면", for: .normal)
        button.addTarget(self, action: #selector(goToBViewController(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        aLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        aLabel.textAlignment = .center
        aLabel.text = from
        view.addSubview(aLabel)
    }
    
    @objc func goToBViewController(_ sender: UIButton) {
        guard let aViewController = presentingViewController as? AViewController
            else { return }
        
        let num = Int(self.from)! + 1
        aViewController.from = String(num)
        
        presentingViewController?.dismiss(animated: true)
    }
}
