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
		
        //change
        let screenThreeVC = ScreenThreeViewController()
        let navController = UINavigationController(rootViewController: screenThreeVC)
        
		self.window = window
        self.window?.rootViewController = navController
		self.window?.makeKeyAndVisible()
		
	}
}

