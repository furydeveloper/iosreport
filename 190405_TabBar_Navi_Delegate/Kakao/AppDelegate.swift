//
//  AppDelegate.swift
//  Kakao
//
//  Created by Fury on 06/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let nvFirstController = UINavigationController(rootViewController: firstVC)
        let nvSecondController = UINavigationController(rootViewController: secondVC)
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [nvFirstController, nvSecondController]
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
