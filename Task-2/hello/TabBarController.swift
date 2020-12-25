//
//  TabBarController.swift
//  hello
//
//  Created by Yaroslav Hrytsun on 24.12.2020.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createViewController(), createSecondViewController(), createThirdViewController(), createFourthViewController()]
    }
   
    
    private func createViewController() -> UINavigationController {
        let vc = ViewController()
        vc.title = "First Animation"
        vc.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    
    private func createSecondViewController() -> UINavigationController {
        let vc = SecondViewController()
        vc.title = "Second Animation"
        vc.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    
    private func createThirdViewController() -> UINavigationController {
        let vc = ThirdViewController()
        vc.title = "Third Animation"
        vc.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    
    private func createFourthViewController() -> UINavigationController {
        let vc = FourthViewController()
        vc.title = "Fourth Animation"
        vc.tabBarItem = UITabBarItem(title: "Fourth", image: nil, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
}

