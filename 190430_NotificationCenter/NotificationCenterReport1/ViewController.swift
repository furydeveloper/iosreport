//
//  ViewController.swift
//  NotificationCenterReport1
//
//  Created by Fury on 30/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

/*
 1. RGBA 값을 지닌 UISlider와 NotificationCenter를 이용해 배경색상 변경하기
 - 탭바컨트롤러의 FirstVC에서 슬라이더값을 조절하고 버튼을 누르면 Notification 이벤트를 발생시키는 코드 작성
 - SecondVC에서 Notification을 전달받아 RGBA를 조합하여 배경색 변경
 */
import UIKit

class ViewController: UIViewController {
    
    let notiCenter = NotificationCenter.default
    
    let redLabel: UILabel = {
        let redLabel = UILabel()
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        return redLabel
    }()
    
    let greenLabel: UILabel = {
        let greenLabel = UILabel()
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        return greenLabel
    }()
    
    let blueLabel: UILabel = {
        let blueLabel = UILabel()
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        return blueLabel
    }()
    
    let alphaLabel: UILabel = {
        let alphaLabel = UILabel()
        alphaLabel.translatesAutoresizingMaskIntoConstraints = false
        return alphaLabel
    }()
    
    let redSlider: UISlider = {
        let redSlider = UISlider()
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        return redSlider
    }()
    
    let greenSlider: UISlider = {
        let redSlider = UISlider()
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        return redSlider
    }()
    
    let blueSlider: UISlider = {
        let redSlider = UISlider()
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        return redSlider
    }()
    
    let alphaSlider: UISlider = {
        let redSlider = UISlider()
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        return redSlider
    }()
    
    let setButton: UIButton = {
        let setButton = UIButton(type: .system)
        setButton.translatesAutoresizingMaskIntoConstraints = false
        return setButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        addSubView()
        autolayout()
    }

    private func configuration() {
        redLabel.text = "Red"
        redLabel.textAlignment = .center
        greenLabel.text = "Green"
        greenLabel.textAlignment = .center
        blueLabel.text = "Blue"
        blueLabel.textAlignment = .center
        alphaLabel.text = "Alpha"
        alphaLabel.textAlignment = .center
        setButton.setTitle("Set Color", for: .normal)
        setButton.addTarget(self, action: #selector(setButtonDidTap(_:)), for: .touchUpInside)
    }
    
    @objc private func setButtonDidTap(_ sender: UIButton) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        let a = CGFloat(alphaSlider.value)
//        let background = UIColor(red: r, green: g, blue: b, alpha: a)
        notiCenter.post(
            name: SecondViewController.changeBackgroundColor,
            object: sender,
            userInfo: ["color": UIColor(red: r, green: g, blue: b, alpha: a)]
        )
    }
    
    private func addSubView() {
        view.addSubview(redLabel)
        view.addSubview(greenLabel)
        view.addSubview(blueLabel)
        view.addSubview(alphaLabel)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(alphaSlider)
        view.addSubview(setButton)
    }
    
    private func autolayout() {
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 20
        NSLayoutConstraint.activate([
            redLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
            redLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            redLabel.centerYAnchor.constraint(equalTo: redSlider.centerYAnchor),
            
            redSlider.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3),
            redSlider.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor),
            redSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin * 2),
            redSlider.widthAnchor.constraint(equalTo: redLabel.widthAnchor, multiplier: 3),
            /* */
            greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: margin),
            greenLabel.leadingAnchor.constraint(equalTo: redLabel.leadingAnchor),
            greenLabel.centerYAnchor.constraint(equalTo: greenSlider.centerYAnchor),
            
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: margin),
            greenSlider.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor),
            greenSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin * 2),
            greenSlider.widthAnchor.constraint(equalTo: greenLabel.widthAnchor, multiplier: 3),
            /* */
            blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: margin),
            blueLabel.leadingAnchor.constraint(equalTo: redLabel.leadingAnchor),
            blueLabel.centerYAnchor.constraint(equalTo: blueSlider.centerYAnchor),
            
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: margin),
            blueSlider.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor),
            blueSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin * 2),
            blueSlider.widthAnchor.constraint(equalTo: blueLabel.widthAnchor, multiplier: 3),
            /* */
            alphaLabel.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: margin),
            alphaLabel.leadingAnchor.constraint(equalTo: redLabel.leadingAnchor),
            alphaLabel.centerYAnchor.constraint(equalTo: alphaSlider.centerYAnchor),
            
            alphaSlider.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: margin),
            alphaSlider.leadingAnchor.constraint(equalTo: alphaLabel.trailingAnchor),
            alphaSlider.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin * 2),
            alphaSlider.widthAnchor.constraint(equalTo: redLabel.widthAnchor, multiplier: 3),
            /* */
            setButton.topAnchor.constraint(equalTo: alphaLabel.bottomAnchor, constant: margin),
            setButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            setButton.heightAnchor.constraint(equalToConstant: 80),
            ])
    }

}

