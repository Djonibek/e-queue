//
//  TabBarController.swift
//  E-Queue
//
//  Created by Muslim on 20/01/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            generateVC(vc: ServicesVC(nibName: "ServicesVC", bundle: nil),
                       image: UIImage(named: "home")),
//            generateVC(vc: ServicesVC(nibName: "ServicesVC", bundle: nil),
//                       image: UIImage(named: "search")),
            generateVC(vc: AllTicketsVC(nibName: "AllTicketsVC", bundle: nil),
                       image: UIImage(named: "bell")),
            generateVC(vc: ProfileVC(nibName: "ProfileVC", bundle: nil),
                       image: UIImage(named: "person")),
        ]
    }
    
    func generateVC(vc: UIViewController, title: String? = nil, image: UIImage? = nil) -> UIViewController{
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
