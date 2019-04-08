//
//  AppDelegate.swift
//  FastCampusLogin
//
//  Created by Fury on 05/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let ud = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let isAuto = ud.bool(forKey: "AutoLogin")
        if isAuto {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = SecondViewController()
            appDelegate.window?.makeKeyAndVisible()
        }
        
        return true
    }
}

