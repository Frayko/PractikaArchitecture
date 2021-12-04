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
		self.configureUI()
		self.configureImage()
		self.configureText()
		self.configureDetailText()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		self.imageView?.frame = .init(x: FeedMetrics.cellImageViewX,
									  y: self.bounds.height / 6,
									  width: FeedMetrics.cellImageViewSize,
									  height: FeedMetrics.cellImageViewSize)
		
		self.textLabel?.frame = .init(x: FeedMetrics.cellTextX,
									  y: FeedMetrics.cellTitleTextLabelY,
									  width: FeedMetrics.cellTextWidth,
									  height: FeedMetrics.cellTitleTextHeight)
		
		self.detailTextLabel?.frame = .init(x: FeedMetrics.cellTextX,
											y: FeedMetrics.cellDetailTextViewY,
											width: FeedMetrics.cellTextWidth,
											height: FeedMetrics.cellDetailTextHeight)
	}
}

extension FeedViewCell {
	func setImage(imageName: String) {
		self.imageView?.image = UIImage(named: imageName) ?? UIImage()
	}
	
	func setTitle(_ text: String) {
		self.textLabel?.text = text
	}
	
	func setDescription(_ text: String) {
		self.detailTextLabel?.text = text
	}
}

private extension FeedViewCell {
	func configureUI() {
		self.backgroundColor = .systemBackground
	}
	
	func configureDetailText() {
		self.detailTextLabel?.textColor = .label
		self.detailTextLabel?.numberOfLines = 2
		self.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
	}
	
	func configureText() {
		self.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
	}

	func configureImage() {
		self.imageView?.contentMode = .scaleAspectFit
		self.imageView?.layer.cornerRadius = FeedMetrics.cellImageViewRadius
		self.imageView?.layer.opacity = FeedMetrics.cellImageViewOpacity
		self.imageView?.backgroundColor = .systemGray6
	}
}
