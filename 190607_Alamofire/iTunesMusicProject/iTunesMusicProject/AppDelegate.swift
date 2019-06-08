//
//  AppDelegate.swift
//  iTunesMusicProject
//
//  Created by Fury on 07/06/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = MusicViewController()
        
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        
        
        return true
    }
}
