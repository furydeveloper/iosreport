//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
  
    let dominoAllData = DataManager.shared
    var currentCategory: Int = 0
    var currentProduct: Int = 0
    var currentMenu: PizzaData?
    
    var orderCount: Int = 0 {
        didSet {
            dominoAllData.dominoPizzaAllData?.menus[currentCategory].product[currentProduct].orderCount = orderCount
            countLabel.text = "\(orderCount) 개"
        }
    }
    
    var detailImage: UIImageView = {
        let detailImage = UIImageView()
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
    }()
    
    var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return bottomView
    }()
    
    var minusButton: UIButton = {
        let minusButton = UIButton()
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        return minusButton
    }()
    
    var plusButton: UIButton = {
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        return countLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configuration()
        addSubView()
        autolayout()
    }
    
    private func configuration() {
        currentCategory = dominoAllData.currentCategory!
        currentProduct = dominoAllData.currentProduct!
        currentMenu = dominoAllData.dominoPizzaAllData
        orderCount = currentMenu?.menus[currentCategory].product[currentProduct].orderCount ?? 0
        title = "\(currentMenu?.menus[currentCategory].product[currentProduct].productName ?? "")"
        detailImage.image = UIImage(named: (currentMenu?.menus[currentCategory].product[currentProduct].productName)!)
        
        countLabel.backgroundColor = .darkGray
        countLabel.textAlignment = .center
        countLabel.text = "\(orderCount)개"
        countLabel.textColor = .white
        countLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.borderColor = UIColor.darkGray.cgColor
        plusButton.layer.borderWidth = 2.0
        plusButton.addTarget(self, action: #selector(plusButtonDidTap(_:)), for: .touchUpInside)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.borderColor = UIColor.darkGray.cgColor
        minusButton.layer.borderWidth = 2.0
        minusButton.addTarget(self, action: #selector(minusButtonDidTap(_:)), for: .touchUpInside)
    }
    
    @objc private func plusButtonDidTap(_ sender: UIButton) {
        orderCount += 1
    }
    
    @objc private func minusButtonDidTap(_ sender: UIButton) {
        guard orderCount > 0 else { return }
        orderCount -= 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orderCount =  (dominoAllData.dominoPizzaAllData?.menus[currentCategory].product[currentProduct].orderCount)!
    }
    
    private func addSubView() {
        view.addSubview(detailImage)
        view.addSubview(bottomView)
        bottomView.addSubview(minusButton)
        bottomView.addSubview(plusButton)
        bottomView.addSubview(countLabel)
    }
    
    private func autolayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            detailImage.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
            detailImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            detailImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            detailImage.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 3),
            
            bottomView.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 40),
            bottomView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            bottomView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40),
                        
            minusButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 40),
            minusButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor),
            minusButton.heightAnchor.constraint(equalTo: countLabel.heightAnchor),
            minusButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            countLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            countLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            countLabel.widthAnchor.constraint(equalTo: minusButton.widthAnchor, multiplier: 3),
            countLabel.heightAnchor.constraint(equalToConstant: 60),
            
            plusButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor),
            plusButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -40),
            plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor),
            plusButton.heightAnchor.constraint(equalTo: countLabel.heightAnchor),
            plusButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
            ])  
    }
}
