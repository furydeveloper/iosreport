//
//  SecondViewController.swift
//  FirstReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func changeLable(_ label: UILabel?) -> Void
}

class SecondViewController: UIViewController {
    
    let ud = UserDefaults.standard
    
    weak var delegate: SecondViewControllerDelegate?
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        delegate?.changeLable(displayLabel)
        // userDefaultConfiguration()
        // singletonConfiguration()
        
        
    }
    
    @IBAction func backButtyon(_ sender: Any) {
        dismiss(animated: true)
    }

    private func userDefaultConfiguration() {
        if let text = ud.string(forKey: "text") {
            displayLabel.text = text
        }
    }
    
    private func singletonConfiguration() {
        let data = SaveDataSingleton.shared
        displayLabel.text = data.str
    }
}
