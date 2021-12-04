//
//  FeedView.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 04.12.2021.
//

import UIKit

protocol IFeedView: UIView {
	func setTableViewDelegate(controller: IFeedVC)
	func setTableViewDataSource(controller: IFeedVC)
	func didLoad()
}

final class FeedView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .plain)
		tableView.rowHeight = FeedMetrics.tableRowHeight
		tableView.register(FeedViewCell.self, forCellReuseIdentifier: FeedViewCell.identifier)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()
}

extension FeedView: IFeedView {
	func setTableViewDelegate(controller: IFeedVC) {
		self.tableView.delegate = controller
	}
	
	func setTableViewDataSource(controller: IFeedVC) {
		self.tableView.dataSource = controller
	}
	
	func didLoad() {
		configureUI()
		configureView()
	}
}

private extension FeedView {
	func configureUI() {
		self.backgroundColor = .systemBackground
	}
	
	func configureView() {
		self.addSubview(self.tableView)
		
		let safeArea = self.safeAreaLayoutGuide
		
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
		])
	}
}
