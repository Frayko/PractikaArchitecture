//
//  FeedModel.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import UIKit

protocol IFeedModel {
	func setImageName(_ name: String)
	func getImageName() -> String
	func setTitle(_ text: String)
	func getTitle() -> String
	func setDescription(_ text: String)
	func getDescription() -> String
}

final class FeedModel {
	private var imageName: String?
	private var title: String?
	private var description: String?
}

extension FeedModel: IFeedModel {
	func setImageName(_ name: String) {
		self.imageName = name
	}
	
	func getImageName() -> String {
		guard let imageName = self.imageName else {
			return ""
		}
		return imageName
	}
	
	func setTitle(_ text: String) {
		self.title = text
	}
	
	func getTitle() -> String {
		guard let title = self.title else {
			return ""
		}
		return title
	}
	
	func setDescription(_ text: String) {
		self.description = text
	}
	
	func getDescription() -> String {
		guard let description = self.description else {
			return ""
		}
		return description
	}
}
