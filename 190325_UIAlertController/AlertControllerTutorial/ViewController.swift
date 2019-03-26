//
//  ViewController.swift
//  AlertControllerTutorial
//
//  Created by Fury on 25/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 40))
        displayLabel.text = "0"
        displayLabel.textAlignment = .center
        view.addSubview(displayLabel)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 40)
        button.setTitle("버튼", for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func didTapButton(_ sendler: UIButton) {
        let alertDialog = UIAlertController(
            title: "카운트 추가?",
            message: nil,
            preferredStyle: .alert)
        
        let upAction = UIAlertAction(title: "Add Count", style: .default) { _ in
            var displayNum = Int(self.displayLabel.text!)!
            
            guard let someValue = Int(alertDialog.textFields![0].text!) else {
                return
            }
            
            if let tf = alertDialog.textFields?[0], let text = tf.text,
                text.isEmpty {
                displayNum += 1
            } else {
                displayNum += Int((alertDialog.textFields?[0].text)!)!
            }
            self.displayLabel.text = String(displayNum)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let resetAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            self.displayLabel.text = "0"
        }
        
        alertDialog.addAction(upAction)
        alertDialog.addAction(cancelAction)
        alertDialog.addAction(resetAction)
        alertDialog.addTextField { (tf) in
            
            
        }
        
        present(alertDialog, animated: true)
    }
}
