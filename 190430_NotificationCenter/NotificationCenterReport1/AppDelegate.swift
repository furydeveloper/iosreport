//
//  AppDelegate.swift
//  NotificationCenterReport1
//
//  Created by Fury on 30/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let fVC = ViewController()
        let sVC = SecondViewController()
        sVC.viewDidLoad()
        
        fVC.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 0)
        sVC.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 1)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [fVC, sVC]
        
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
