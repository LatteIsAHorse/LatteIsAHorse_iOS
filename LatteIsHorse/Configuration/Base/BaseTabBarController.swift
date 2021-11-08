//
//  BaseTabBarController.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/07.
//

import UIKit
//tab_home_focus
//tab_profile
//tab_search
//tab_second

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let mainViewController  = MainQuizViewController()
    let networkViewController = MainQuizViewController()
    
    let actionTabBarItem  = UITabBarItem(title: "", image: UIImage(named: "tab_home_focus"), tag: 0)
    let networkTabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_search"), tag: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        let actionNavigationController = UINavigationController(rootViewController: mainViewController)
        let networkNavigationController = UINavigationController(rootViewController: networkViewController)
        
        actionNavigationController.tabBarItem  = actionTabBarItem
        networkNavigationController.tabBarItem = networkTabBarItem
        
        self.viewControllers = [actionNavigationController, networkNavigationController]
        
        self.delegate = self
    }
    
    func setTabBar() {
        tabBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            
            let tabBarAppearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()
            
            tabBarAppearance.backgroundColor = .white
            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
            
        }
    }
}
