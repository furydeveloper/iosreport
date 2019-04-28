//
//  WishListViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class WishListViewController: UIViewController {
    
    let dominoAllData = DataManager.shared
    var currentOrder: PizzaData?
    
    var categoryCount: Int = 0
    var productCount: [Int] = []
    var wishList: [Product] = []
    
    let wishListTableView: UITableView = {
        let wishListTableView = UITableView()
        wishListTableView.translatesAutoresizingMaskIntoConstraints = false
        return wishListTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        addSubView()
        autolayout()
    }
    
    private func configuration() {
        title = "Wish List"
        let rightNavigationItem = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(orderButton(_:)))
        let leftNavigationItem = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(removeAll))
        navigationItem.rightBarButtonItem = rightNavigationItem
        navigationItem.leftBarButtonItem = leftNavigationItem
        
        wishListTableView.dataSource = self
        wishListTableView.register(WishListTableViewCell.self, forCellReuseIdentifier: WishListTableViewCell.identifier)
        wishListTableView.rowHeight = 100
        
        categoryCount = dominoAllData.dominoPizzaAllData!.menus.count
        for i in 0..<categoryCount {
            productCount.append(dominoAllData.dominoPizzaAllData!.menus[i].product.count)
        }
        
        makeWishList()
    }
    
    private func makeWishList() {
        wishList = []
        currentOrder = dominoAllData.dominoPizzaAllData
        
        for i in 0..<categoryCount {
            for j in 0..<productCount[i] {
                if (currentOrder?.menus[i].product[j].orderCount)! > 0 {
                    wishList.append((currentOrder?.menus[i].product[j])!)
                }
            }
        }
    }
    
    private func addSubView() {
        view.addSubview(wishListTableView)
    }
    
    private func autolayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            wishListTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            wishListTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            wishListTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            wishListTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
    
    @objc func orderButton(_ sender: UIButton) {
        var msg: String = ""
        var totalPrice: Int = 0
        for i in wishList {
            msg += "\(i.productName) - \(i.orderCount)개\n"
            totalPrice += i.productPrice * i.orderCount
        }
        msg += "결제금액 : \(totalPrice)원"
        
        alertDialog(msg, totalPrice)
    }
    
    @objc func removeAll() {
        wishList = []
        for i in 0..<categoryCount {
            for j in 0..<productCount[i] {
                currentOrder?.menus[i].product[j].orderCount = 0
            }
        }
        wishListTableView.reloadData()
    }
    
    private func alertDialog(_ msg: String, _ totalPrice: Int) {
        let alertController = UIAlertController(title: "결제내역", message: msg, preferredStyle: .alert)
        let payButton = UIAlertAction(title: "결제하기", style: .default) { _ in
            self.removeAll()
        }
        let cancelButton = UIAlertAction(title: "돌아가기", style: .cancel)
        alertController.addAction(payButton)
        alertController.addAction(cancelButton)
        
        
        present(alertController, animated: true)
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.identifier, for: indexPath) as! WishListTableViewCell
        cell.menuImage.image = UIImage(named: wishList[indexPath.row].productName)
        cell.menuNameLabel.text = wishList[indexPath.row].productName
        cell.orderCountLabel.text = "주문수량 : \(wishList[indexPath.row].orderCount)"
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeWishList()
        wishListTableView.reloadData()
    }
}
