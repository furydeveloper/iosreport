//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        
        
    }
    
    var isQuadruple = false
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        print("didTap")
        if !isQuadruple {
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        } else {
            imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
    }
    
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        let rotaion = sender.rotation
        imageView.transform = imageView.transform.rotated(by: rotaion)
        sender.rotation = 0
        
        //        imageView.transform = CGAffineTransform.identity.rotated(by: rotaion)
        //        print("heelo")
        
    }
    
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        
        imageView.image = UIImage(named: "cat2")
    }
    
    @IBAction func handleSwipeGesture2(_ sender: UISwipeGestureRecognizer) {
        
        imageView.image = UIImage(named: "cat1")
    }
}

// 스와이프 제스처 오른쪽 cat2 , 왼쪽 cat1
