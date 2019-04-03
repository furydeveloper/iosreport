//
//  SecondViewController.swift
//  SecondProject
//
//  Created by Fury on 02/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var imageName = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)
    }

    
    @IBAction func addCountButton(_ sender: UIButton) {
        if let fVC = presentingViewController as? FirstViewController {
            fVC.dogCnt += 1
            fVC.catCnt += 1
            fVC.birdCnt += 1
        }
    }
}
