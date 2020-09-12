//
//  LaunchAssembly.swift
//  VKDonations
//
//  Created by Максим Стегниенко on 11.09.2020.
//  Copyright © 2020 Максим Стегниенко. All rights reserved.
//

import UIKit.UIViewController

final class LaunchAssembly {
    static func assembleModule() -> UIViewController {
        let rootViewController = LaunchViewController()
        rootViewController.navigationItem.title = "Пожертвования"
       
        let view = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationController?.navigationBar.isTranslucent = false
        
        return view
    }
}
