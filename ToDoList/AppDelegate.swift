//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Михаил on 25/03/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = MainViewController()
        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()
        
        return true
    }

}

