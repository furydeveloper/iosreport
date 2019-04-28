//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
    
    let dominoAllData = DataManager.shared
    var currentMenu: PizzaData?
    var currentCategory: Int = 0
    
    let productTableView: UITableView = {
        let productTableView = UITableView()
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        return productTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeData()
        configuration()
        addSubView()
        autolayout()
    }
    
    private func makeData() {
        currentMenu = dominoAllData.dominoPizzaAllData
    }
    
    private func configuration() {
        currentCategory = dominoAllData.currentCategory!
        title = "\(currentMenu?.menus[currentCategory].categoryName ?? "")"
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        
    }
    
    private func addSubView() {
        view.addSubview(productTableView)
    }
    
    private func autolayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            productTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount: Int = (currentMenu?.menus[currentCategory].product.count)!
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        cell.menuImage.image = UIImage(named: currentMenu?.menus[currentCategory].product[indexPath.row].productName ?? "")
        cell.menuNameLabel.text = currentMenu?.menus[currentCategory].product[indexPath.row].productName
        cell.menuPriceLabel.text = "\( (currentMenu?.menus[currentCategory].product[indexPath.row].productPrice)!)원"
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        dominoAllData.currentProduct = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
