//
//  AppDelegate.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchAssembly.assembleModule()
        window?.makeKeyAndVisible()
        
        let appearance = UIBarButtonItem.appearance()
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.clear
        ]

        appearance.setTitleTextAttributes(attributes, for: .normal)
        appearance.setTitleTextAttributes(attributes, for: .highlighted)
        
        return true
    }

}

