//
//  ViewController.swift
//  ViewFrameLayout
//
//  Created by Fury on 25/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bView = setupSuperview4()
        let rView = setupSuperview5(superView: bView)
        setupSuperview6(subView: rView)
    }
    
    /*
     func setupSuperview1() -> UIView {
     let greenView = UIView()
     greenView.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
     greenView.backgroundColor = .green
     view.addSubview(greenView)
     return greenView
     }
     
     func setupSuperview2() -> UIView {
     let greenView = UIView()
     greenView.frame = CGRect(x: 15, y: view.frame.height - 115, width: 345, height: 100)
     greenView.backgroundColor = .green
     view.addSubview(greenView)
     return greenView
     }
     
     func setupSuperview3() -> UIView {
     let greenView = UIView()
     greenView.frame = CGRect(x: 15, y: 15, width: view.frame.size.width - 30, height: 100)
     greenView.backgroundColor = .green
     view.addSubview(greenView)
     return greenView
     }
     */
    
    func setupSuperview4() -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect(x: 30, y: 30, width: view.frame.size.width - 60, height: view.frame.size.height - 60)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        return blueView
    }
    
    func setupSuperview5(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect(x: 30, y: 30, width: superView.frame.size.width - 60, height: superView.frame.size.height - 60)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    
    func setupSuperview6(subView: UIView) {
        let greenView = UIView()
        greenView.frame = CGRect(x: 30, y: 30, width: subView.frame.size.width - 60, height: subView.frame.size.height - 60)
        greenView.backgroundColor = .green
        subView.addSubview(greenView)
    }
}

