//
//  ScreenThreeModel.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import Foundation

final class ScreenThreeModel {
    private var data: DataThreeModel?
 
    func updateData(data: DataThreeModel) {
		self.data = data
        
        print("update")
    }
	
	func getData() -> DataThreeModel {
		guard let data = self.data else {
			return DataThreeModel(id: UUID(),
								  imageName: "",
								  title: "",
								  author: "",
								  description: "")
		}
		
		return data
	}
    
    func loadData(id: UUID) {
		let rawFeed = Feeds.getFeed(id: id)
		
		guard let rawFeed = rawFeed else {
			return
		}
		
		self.data = DataThreeModel(id: rawFeed.id,
								   imageName: rawFeed.imageName,
								   title: rawFeed.title,
								   author: rawFeed.author,
								   description: rawFeed.description_max)
    }

}
