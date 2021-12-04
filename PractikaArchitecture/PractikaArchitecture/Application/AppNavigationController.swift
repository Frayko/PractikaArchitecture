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
			NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
		]
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.titleTextAttributes = attrs
		appearance.backgroundColor = .systemBackground
		navigationBar.standardAppearance = appearance
		navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance

		self.navigationBar.tintColor = .systemGreen
	}
	
	func configureView() {
        let firstScreen = MainAssembler.assemble()
		self.setViewControllers([firstScreen], animated: true)
	}
}
