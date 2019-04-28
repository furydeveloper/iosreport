//
//  WishListTableViewCell.swift
//  DominoPizzaExam
//
//  Created by Fury on 28/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListTableViewCell: UITableViewCell {
    
    static let identifier = "WishListTableCell"
    
    let menuImage: UIImageView = {
        let menuImage = UIImageView()
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        return menuImage
    }()
    
    let menuNameLabel: UILabel = {
        let menuNameLabel = UILabel()
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return menuNameLabel
    }()
    
    let orderCountLabel: UILabel = {
        let orderCountLabel = UILabel()
        orderCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return orderCountLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configuration()
        addContentView()
        autolayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        menuNameLabel.font = UIFont.systemFont(ofSize: 20)
        orderCountLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func addContentView() {
        menuImage.contentMode = .scaleAspectFit
        contentView.addSubview(menuImage)
        contentView.addSubview(menuNameLabel)
        contentView.addSubview(orderCountLabel)
    }
    
    private func autolayout() {
        let margin: CGFloat = 10
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            menuImage.heightAnchor.constraint(equalToConstant: 100),
            menuImage.widthAnchor.constraint(equalToConstant: 100),
            
            menuNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuNameLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: margin),
            
            orderCountLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor),
            orderCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderCountLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: margin),
            orderCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            orderCountLabel.heightAnchor.constraint(equalTo: menuNameLabel.heightAnchor)
            ])
    }
}
