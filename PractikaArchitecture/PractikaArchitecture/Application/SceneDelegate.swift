//
//  SceneDelegate.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)
<<<<<<< HEAD
		
        //change
        let screenThreeVC = ScreenThreeViewController()
        let navController = UINavigationController(rootViewController: screenThreeVC)
        
=======
		let appNavigationController = AppNavigationController()
		window.rootViewController = appNavigationController
>>>>>>> 88b81b2d8fd9aae89a714b7e3f1d592a54a30c52
		self.window = window
        self.window?.rootViewController = navController
		self.window?.makeKeyAndVisible()
		
	}
}

