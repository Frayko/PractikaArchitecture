//
//  AppNavigationController.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 03.12.2021.
//

import UIKit

final class AppNavigationController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		configureNavigationController()
		configureView()
	}
}

private extension AppNavigationController {
	func configureNavigationController() {
		let attrs = [
			NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)
		]
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.titleTextAttributes = attrs
		appearance.backgroundColor = .systemBackground
		navigationBar.standardAppearance = appearance
		navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
		
		self.navigationBar.backIndicatorImage = UIImage()
		self.navigationBar.backIndicatorTransitionMaskImage = UIImage()
		self.navigationBar.tintColor = .systemGreen
	}
	
	func configureView() {
		/*
			сюда для проверки можно цеплять свои экраны, пример ниже
		let firstScreen = FirstScreen()
				 
		self.setViewControllers([firstScreen], animated: true)
			ИЛИ
		self.pushViewController(firstScreen, animated: true)
		*/
	}
}
