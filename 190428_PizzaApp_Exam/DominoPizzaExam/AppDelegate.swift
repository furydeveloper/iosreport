//
//  AppDelegate.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarController = UITabBarController()
        let categoryVC = CategoryViewController()
        let wishlistVC = WishListViewController()
        
        categoryVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        wishlistVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        tabbarController.viewControllers = [
            UINavigationController.init(rootViewController: categoryVC),
            UINavigationController.init(rootViewController: wishlistVC),
        ]
        
        window?.backgroundColor = .white
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
