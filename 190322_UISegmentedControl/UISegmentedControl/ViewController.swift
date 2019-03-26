//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Fury on 22/03/2019.
//  Copyright © 2019 Fury. All rights reserved.
//  UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var showLabel: UILabel!
    @IBOutlet var uiSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSegment.addTarget(self, action: #selector(changeSegmentLabel(_:)), for: .valueChanged)
        
        changeSegmentLabel(uiSegment)
    }

    @objc func changeSegmentLabel(_ sender: UISegmentedControl) {
        let sgementIndex = sender.selectedSegmentIndex
        showLabel.text = sender.titleForSegment(at: sgementIndex)
    }
}
