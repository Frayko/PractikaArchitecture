//
//  MainAssemler.swift
//  PractikaArchitecture
//
//  Created by Alexandr Evtodiy on 27.11.2021.
//

import Foundation

final class MainAssembler {
    
    static func assemble() -> MainController {
        let model = MainModel()
        let controller = MainController(dependencies: .init(model: model))
        return controller
    }
}
