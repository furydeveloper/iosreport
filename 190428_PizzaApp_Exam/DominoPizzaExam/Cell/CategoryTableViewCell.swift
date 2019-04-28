//
//  CategoryTableViewCell.swift
//  DominoPizzaExam
//
//  Created by Fury on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryTableCell"
    
    let categoryImage: UIImageView = {
        let categoryImage = UIImageView()
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        return categoryImage
    }()
    
    var category: String? {
        didSet {
            categoryImage.image = UIImage(named: category!)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(categoryImage)
        autolayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autolayout() {
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
}
