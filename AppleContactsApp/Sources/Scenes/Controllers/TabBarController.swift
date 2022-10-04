//
//  TabBarController.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 04.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupViewControllers()
    }
    
    // MARK: - Setup
    
    private func setupTabBar() {
        
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .darkGray
    }
    
    private func setupViewControllers() {
        
        viewControllers = [
            createNavigationController(for: ViewController(),
                                       title: "Избранное",
                                       image: "star.fill"),
            createNavigationController(for: ViewController(),
                                       title: "Недавние",
                                       image: "clock.fill"),
            createNavigationController(for: ContactListVC(),
                                       title: "Контакты",
                                       image: "person.crop.circle.fill"),
            createNavigationController(for: ViewController(),
                                       title: "Клавиши",
                                       image: "circle.grid.3x3.fill"),
            createNavigationController(for: ViewController(),
                                       title: "Автоответчик",
                                       image: "recordingtape")
        ]
    }

    private func createNavigationController(for rootViewController: UIViewController,
                                            title: String,
                                            image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        
        return navController
    }
}
