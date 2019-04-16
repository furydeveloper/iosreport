//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let phoneName = ["iPhoneSE_Gold", "iPhoneSE_RoseGold", "iPhone8", "iPhoneX_White", "iPhoneX_SpaceGray"]
    
    private let itemList = [
        "iPhoneSE_Gold": 5, "iPhoneSE_RoseGold": 3, "iPhone8": 6, "iPhoneX_White": 2, "iPhoneX_SpaceGray": 4,
    "iPhoneSE_Gold-1": 1, "iPhoneSE_RoseGold-1": 2, "iPhone8-1": 5, "iPhoneX_White-1": 6, "iPhoneX_SpaceGray-1": 1,
    "iPhoneSE_Gold-2": 6, "iPhoneSE_RoseGold-2": 8, "iPhone8-2": 4, "iPhoneX_White-2": 7, "iPhoneX_SpaceGray-2": 2
    ]
    
    let shard = RetainSingleton.shard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.register(ItemCell.self, forCellReuseIdentifier: "CellId")
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ItemCell
        cell.delegate = self
        
        switch indexPath.row {
        case 0...4:
            cell.itemImageView.image = UIImage(named: phoneName[indexPath.row])
            cell.itemNameLabel.text = "\(phoneName[indexPath.row])"
            cell.countLabel.text = String(shard.countDic[indexPath.row])
        case 5...9:
            cell.itemImageView.image = UIImage(named: phoneName[indexPath.row - 5])
            cell.itemNameLabel.text = "\(phoneName[indexPath.row - 5] + "-1")"
            cell.countLabel.text = String(shard.countDic[indexPath.row])
        case 10...14:
            cell.itemImageView.image = UIImage(named: phoneName[indexPath.row - 10])
            cell.itemNameLabel.text = "\(phoneName[indexPath.row - 10] + "-2")"
            cell.countLabel.text = String(shard.countDic[indexPath.row])
        default:
            break
        }
        
        return cell
    }
}

extension ViewController: ItemCellDelegate {
    func changeCount(_ itemCell: ItemCell, button: UIButton) {
        if let indexPath = tableView.indexPath(for: itemCell) {
            var numStr = itemCell.countLabel.text!
            var num = Int(numStr)!
            
            switch indexPath.row {
            case 0...4:
                if num < itemList[phoneName[indexPath.row]]! {
                    num += 1
                    numStr = String(num)
                    itemCell.countLabel.text = "\(numStr)"
                    shard.countDic[indexPath.row] = num
                } else {
                    itemCell.backgroundColor = .red
                    UIView.animate(withDuration: 1) {
                        itemCell.backgroundColor = .white
                    }
                    alertDialog()
                }
            case 5...9:
                if num < itemList[phoneName[indexPath.row - 5]]! {
                    num += 1
                    numStr = String(num)
                    itemCell.countLabel.text = "\(numStr)"
                    shard.countDic[indexPath.row] = num
                } else {
                    itemCell.backgroundColor = .red
                    UIView.animate(withDuration: 1) {
                        itemCell.backgroundColor = .white
                    }
                    alertDialog()
                }
            case 10...14:
                if num < itemList[phoneName[indexPath.row - 10]]! {
                    num += 1
                    numStr = String(num)
                    itemCell.countLabel.text = "\(numStr)"
                    shard.countDic[indexPath.row] = num
                } else {
                    itemCell.backgroundColor = .red
                    UIView.animate(withDuration: 1) {
                        itemCell.backgroundColor = .white
                    }
                    alertDialog()
                }
            default: break
            }
        }
    }
    
    private func alertDialog() {
        let alert = UIAlertController(title: "경고", message: "수량 초과", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
}

