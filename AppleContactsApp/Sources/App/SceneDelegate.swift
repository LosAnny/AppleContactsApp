//
//  SceneDelegate.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 04.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = TabBarController()
        tabBarController.selectedIndex = 2
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}

