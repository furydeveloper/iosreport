//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    var firstXY: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        //    imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
  
        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat2")
        }
        
        print("touchesBegan : ",touchPoint)
        
        firstXY = CGPoint(x: imageView.center.x - touchPoint.x, y: imageView.center.y - touchPoint.y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        if imageView.frame.contains(touchPoint) {
            imageView.center = CGPoint(x: touchPoint.x + firstXY!.x, y: touchPoint.y + firstXY!.y)
//            imageView.center = touchPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let touchPoint = touch.location(in: touch.view)
        imageView.image = UIImage(named: "cat1")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        print("====== touchesCancelled ======")
    }
}



