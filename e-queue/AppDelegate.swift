//
//  AppDelegate.swift
//  e-queue
//
//  Created by Fedya on 23/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // tekshiruv Javohir
    //checking Commit Pull Puss Muslim
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let tabBar = TabBarController()
        
        let nav = UINavigationController(rootViewController: ServicesVC(nibName: "ServicesVC", bundle: nil))
        
        window?.rootViewController = tabBar
        
        return true
    }

}

