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
        
        itemImageView.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        itemImageView.contentMode = .scaleAspectFit
        itemNameLabel.frame = CGRect(x: itemImageView.frame.maxX + 20, y: 10, width: 180, height: 60)
        countLabel.frame = CGRect(x: itemNameLabel.frame.maxX + 20, y: 10, width: 50, height: 60)
        button.frame = CGRect(x: countLabel.frame.maxX + 10, y: 10, width: 60, height: 60)
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        delegate?.changeCount(self, button: sender)
    }
  
}
