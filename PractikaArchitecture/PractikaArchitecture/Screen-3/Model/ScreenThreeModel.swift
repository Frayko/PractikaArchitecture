//
//  ScreenThreeModel.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import Foundation

final class ScreenThreeModel {
    
    private var data: DataThreeModel?
    private var feeds: [Feed]?
    private var id = UUID()
    
    private var newData: [Feed]?
 

    func updateData(data: [Feed]) {
        self.feeds = data
        
        print("update")
    }
    
    func loadId(id: UUID) {
        self.id = id
    }

}
