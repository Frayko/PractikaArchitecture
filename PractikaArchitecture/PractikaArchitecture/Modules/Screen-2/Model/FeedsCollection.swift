//
//  FeedsCollection.swift.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import UIKit

final class FeedsCollection {
	private lazy var feeds: [FeedModel] = {
		return getFeeds()
	}()
}

extension FeedsCollection {
	func getFeeds() -> [FeedModel] {
		feeds
	}
}

private extension FeedsCollection {

}

