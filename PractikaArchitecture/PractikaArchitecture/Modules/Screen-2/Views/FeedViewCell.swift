//
//  FeedViewCell.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import UIKit

final class FeedViewCell: UITableViewCell {
	static let identifier = "FeedTableViewCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
		self.initialSetup()
		self.configureImage()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initialSetup() {
		self.imageView?.contentMode = .scaleAspectFit
		self.detailTextLabel?.textColor = .label
		self.detailTextLabel?.numberOfLines = 2
		self.backgroundColor = .systemBackground
	}

	private func configureImage() {
		self.imageView?.layer.cornerRadius = 12
		self.imageView?.layer.opacity = 0.8
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		self.imageView?.frame = .init(x: 16, y: self.bounds.height / 6, width: 52, height: 52)
		self.textLabel?.frame.origin = .init(x: 84, y: 16)
		self.detailTextLabel?.frame.origin = .init(x: 84, y: 43)
	}
}

extension FeedViewCell {
	func setImage(imageName: String) {
		self.imageView?.image = UIImage(named: imageName) ?? UIImage()
		self.imageView?.backgroundColor = .lightGray
	}
	
	func setTitle(_ text: String) {
		self.textLabel?.text = text
	}
	
	func setDescription(_ text: String) {
		self.detailTextLabel?.text = text
	}
}
