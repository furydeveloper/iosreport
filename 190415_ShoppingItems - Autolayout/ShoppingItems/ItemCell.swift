//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit


protocol ItemCellDelegate: class {
    func changeCount(_ itemCell: ItemCell, button: UIButton) -> Void
}

final class ItemCell: UITableViewCell {
    
    let itemImageView = UIImageView()
    let itemNameLabel = UILabel()
    let countLabel = UILabel()
    let button = UIButton()
    
    weak var delegate: ItemCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // AutoLayout Configuration
        itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        itemNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        itemNameLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20).isActive = true
        itemNameLabel.widthAnchor.constraint(greaterThanOrEqualTo: itemImageView.widthAnchor, multiplier: 3).isActive = true
        
        countLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        countLabel.leadingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor, constant: 80).isActive = true
        countLabel.widthAnchor.constraint(lessThanOrEqualTo: itemNameLabel.widthAnchor, multiplier: 3).isActive = true
        
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        button.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemImageView.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        delegate?.changeCount(self, button: sender)
    }
  
}
