//
//  FeedVC.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import UIKit

protocol IFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
}

final class FeedVC: UIViewController {
	private var feedModel: FeedModel
	private let rootView: IFeedView
	private let feeds: [Feed]
	
	init() {
		self.rootView = FeedView()
		self.feeds = Feeds.getFeeds()
		self.feedModel = FeedModel()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var logoutButton: UIBarButtonItem = {
		let button = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(close))
		return button
	}()

	override func loadView() {
		self.rootView.setTableViewDelegate(controller: self)
		self.rootView.setTableViewDataSource(controller: self)
		self.rootView.didLoad()
		self.view = rootView
		
		self.navigationItem.leftBarButtonItem = self.logoutButton
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Feed"
	}
}

extension FeedVC: IFeedVC {
	
}

private extension FeedVC {
	@objc func close() {
		self.navigationController?.popToRootViewController(animated: true)
	}
}

extension FeedVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.feeds.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewCell.identifier, for: indexPath) as! FeedViewCell
		
		let feed = self.feeds[indexPath.row]
		feedModel.setImageName(feed.imageName)
		feedModel.setTitle(feed.title)
		feedModel.setDescription(feed.description_mini)
		
		cell.setImage(imageName: feedModel.getImageName())
		cell.setTitle(feedModel.getTitle())
		cell.setDescription(feedModel.getDescription())
		return cell
	}
}

extension FeedVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let feedData = self.feeds[indexPath.item]
		
		let feed = ScreenThreeViewController(id: feedData.id)
		self.navigationController?.pushViewController(feed, animated: true)
	}
}
