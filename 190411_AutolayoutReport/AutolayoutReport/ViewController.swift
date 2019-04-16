//
//  ViewController.swift
//  AutolayoutReport
//
//  Created by Fury on 12/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

/*
 [ 과제 ]
 1. 오토레이아웃 연습해보기 (별도 이미지 참고)
 - 5개의 뷰를 생성하고 높이는 150으로 통일
 - Safe Area Top 과 60 의 거리
 - 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
 - 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님
 e.g.
 2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
 3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정
 */

import UIKit

class ViewController: UIViewController {
    
    private let aView = UIView()
    private let bView = UIView()
    private let cView = UIView()
    private let dView = UIView()
    private let eView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfiguration()
        
    }
    
    private func viewConfiguration() {
        aView.backgroundColor = .black
        bView.backgroundColor = .blue
        cView.backgroundColor = .green
        dView.backgroundColor = .yellow
        eView.backgroundColor = .orange
        
        view.addSubview(aView)
        view.addSubview(bView)
        view.addSubview(cView)
        view.addSubview(dView)
        view.addSubview(eView)
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        bView.translatesAutoresizingMaskIntoConstraints = false
        cView.translatesAutoresizingMaskIntoConstraints = false
        dView.translatesAutoresizingMaskIntoConstraints = false
        eView.translatesAutoresizingMaskIntoConstraints = false
        
        aView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        aView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        aView.trailingAnchor.constraint(equalTo: bView.leadingAnchor, constant: -8).isActive = true
        aView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        bView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        bView.trailingAnchor.constraint(equalTo: cView.leadingAnchor, constant: -8).isActive = true
        bView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bView.widthAnchor.constraint(equalTo: aView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        
        cView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        cView.trailingAnchor.constraint(equalTo: dView.leadingAnchor, constant: -8).isActive = true
        cView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cView.widthAnchor.constraint(equalTo: bView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true

        dView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        dView.trailingAnchor.constraint(equalTo: eView.leadingAnchor, constant: -8).isActive = true
        dView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        dView.widthAnchor.constraint(equalTo: cView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true

        eView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        eView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        eView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        eView.widthAnchor.constraint(equalTo: dView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
    }
}

