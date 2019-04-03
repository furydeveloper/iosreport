//
//  SecondViewController.swift
//  ThirdProject
//
//  Created by Fury on 02/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var segmentedControllerValue = ""
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   
    @IBAction func backButton(_ sender: UIButton) {
        if let selectedValue = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) {
            segmentedControllerValue = selectedValue
        }
    }
    
}
