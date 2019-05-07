//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    let dominoAllData = DataManager.shared
    
    let categoryTableView: UITableView = {
       let categoryTableVIew = UITableView()
        categoryTableVIew.translatesAutoresizingMaskIntoConstraints = false
        return categoryTableVIew
    }()
    
    let headerView = UIImageView()
    
    var pizzaCategory: [String] = [
        DataImage.categoryImage1,
        DataImage.categoryImage2,
        DataImage.categoryImage3,
        DataImage.categoryImage4,
        DataImage.categoryImage5,
        DataImage.categoryImage6
    ]
    
    var allPizzaData: PizzaData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.image = UIImage(named: DataImage.logo)
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerView.backgroundColor = .white
        headerView.contentMode = .scaleAspectFit
        categoryTableView.tableHeaderView = headerView
        makeData()
        configuration()
        addSubView()
        autolayout()
    }
    
    private func makeData() {
        
        var productArr: [Product] = []
        var categoryArr: [Category] = []
        for (key, value) in PizzaAllData().슈퍼시드 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "슈퍼시드", product: productArr))
        productArr = []
        
        for (key, value) in PizzaAllData().프리미엄 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "프리미엄", product: productArr))
        productArr = []
        
        for (key, value) in PizzaAllData().클래식 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "클래식", product: productArr))
        productArr = []
        
        for (key, value) in PizzaAllData().사이드 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "사이드", product: productArr))
        productArr = []
        
        for (key, value) in PizzaAllData().음료 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "음료", product: productArr))
        productArr = []
        
        for (key, value) in PizzaAllData().소스 {
            productArr.append(Product(productName: key, productPrice: value, orderCount: 0))
        }
        categoryArr.append(Category(categoryName: "소스", product: productArr))
        productArr = []
        
        allPizzaData = PizzaData(menus: categoryArr)
        dominoAllData.dominoPizzaAllData = allPizzaData!
    }
    
    private func configuration() {
        title = "Domino's"
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
    }
    
    private func addSubView() {
        view.addSubview(categoryTableView)
    }
    
    private func autolayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (allPizzaData?.menus.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell

        cell.category = pizzaCategory[indexPath.row]
        
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        productVC.currentCategory = indexPath.row
        dominoAllData.currentCategory = indexPath.row
        navigationController?.pushViewController(productVC, animated: true)
    }
}
