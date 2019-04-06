//
//  ViewController.swift
//  SecondReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{

    var redLabel = UILabel()
    var greenLabel = UILabel()
    var blueLabel = UILabel()
    
    var redUISlider = UISlider()
    var greenUISlider = UISlider()
    var blueUISlider = UISlider()
    
    var nextButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
    }
    
    private func configuration() {
        redLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        redLabel.backgroundColor = .red
        redLabel.text = " red"
        view.addSubview(redLabel)
        
        redUISlider.frame = CGRect(x: 20, y: redLabel.frame.maxY + 20, width: view.frame.width - 40, height: 40)
        view.addSubview(redUISlider)
        
        greenLabel.frame = CGRect(x: 20, y: redUISlider.frame.maxY + 60, width: view.frame.width - 40, height: 40)
        greenLabel.backgroundColor = .green
        greenLabel.text = " green"
        view.addSubview(greenLabel)
        
        greenUISlider.frame = CGRect(x: 20, y: greenLabel.frame.maxY + 20, width: view.frame.width - 40, height: 40)
        view.addSubview(greenUISlider)
        
        blueLabel.frame = CGRect(x: 20, y: greenUISlider.frame.maxY + 60, width: view.frame.width - 40, height: 40)
        blueLabel.backgroundColor = .blue
        blueLabel.text = " blue"
        view.addSubview(blueLabel)
        
        blueUISlider.frame = CGRect(x: 20, y: blueLabel.frame.maxY + 20, width: view.frame.width - 40, height: 40)
        view.addSubview(blueUISlider)
        
        nextButton.frame = CGRect(x: 20, y: view.frame.height - 150, width: view.frame.width - 40, height: 40)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.backgroundColor = .darkGray
        view.addSubview(nextButton)
    }
    
    //CGFloat
    @objc func nextButton(_ sender: UIButton) {
        let backColor = BackgroundSingleton.color
        backColor.red = CGFloat(redUISlider.value)
        backColor.green = CGFloat(greenUISlider.value)
        backColor.blue = CGFloat(blueUISlider.value)
        
        let sVC = SecondViewController()
        present(sVC, animated: true)
    }

}

