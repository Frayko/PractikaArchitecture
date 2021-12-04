//
//  Feeds.swift
//  PractikaArchitecture
//
//  Created by Александр Фомин on 27.11.2021.
//

import Foundation

struct Feed {
    var id = UUID()
	let imageName: String
	let title: String
	let author: String
	let description_mini: String
	let description_max: String
}
