//
//  SceneDelegate.swift
//  Application
//
//  Created by Максим Кузнецов on 28.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = true
        tabBarController.viewControllers = [
            createHomeViewController(),
            createOperationsViewController(),
            createProfileViewController()
        ]
        window.rootViewController = UINavigationController(rootViewController: tabBarController)
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func createHomeViewController() -> UINavigationController {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        
        return UINavigationController(rootViewController: homeViewController)
    }
    
    func createOperationsViewController() -> UINavigationController {
        let operationsViewController = OperationsViewController()
        operationsViewController.tabBarItem = UITabBarItem(
            title: "Transacttions",
            image: UIImage(systemName: "briefcase"),
            tag: 0
        )
        
        return UINavigationController(rootViewController: operationsViewController)
    }
    
    func createProfileViewController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            tag: 0
        )
        
        return UINavigationController(rootViewController: profileViewController)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

