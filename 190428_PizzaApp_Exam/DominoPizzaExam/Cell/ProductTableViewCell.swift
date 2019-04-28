//
//  ProductTableViewCell.swift
//  DominoPizzaExam
//
//  Created by Fury on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    static let identifier = "ProductTableCell"
    
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
    
    let menuPriceLabel: UILabel = {
        let menuPriceLabel = UILabel()
        menuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        return menuPriceLabel
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
        menuPriceLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func addContentView() {
        menuImage.contentMode = .scaleAspectFit
        contentView.addSubview(menuImage)
        contentView.addSubview(menuNameLabel)
        contentView.addSubview(menuPriceLabel)
    }
    
    private func autolayout() {
        let margin: CGFloat = 10
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            menuImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            menuImage.heightAnchor.constraint(equalToConstant: 120),
            menuImage.widthAnchor.constraint(equalToConstant: 120),
            
            menuNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuNameLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: margin),
            
            menuPriceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor),
            menuPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuPriceLabel.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: margin),
            menuPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            menuPriceLabel.heightAnchor.constraint(equalTo: menuNameLabel.heightAnchor)
            ])
    }
}
