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
       
        
        let barButtonItemAppearance = UIBarButtonItem.appearance()

        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        barButtonItemAppearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -200, vertical: 0), for:UIBarMetrics.default)
        barButtonItemAppearance.title = ""
 
     
        
        window = UIWindow()
        
        let signin = SignInVC(nibName: "SignInVC", bundle: nil)
        
        let nav = UINavigationController(rootViewController: signin)
        window?.makeKeyAndVisible()
        window?.rootViewController = nav
        
        return true
    }

}

