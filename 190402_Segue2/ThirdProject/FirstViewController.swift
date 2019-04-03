//
//  ViewController.swift
//  ThirdProject
//
//  Created by Fury on 02/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var segmentedControllerValue = ""

    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.destination)
        if let VC = unwindSegue.source as? SecondViewController {
            displayLabel.text = VC.segmentedControllerValue
        }
    }
}

