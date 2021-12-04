//
//  MainModel.swift
//  PractikaArchitecture
//
//  Created by Alexandr Evtodiy on 03.12.2021.
//

import Foundation

import Foundation

protocol IMainModel {
    func getAuthCode(number: Int, closure: @escaping (Int) -> Void)
}

final class MainModel {
    
}

// MARK: IMainModel
extension MainModel: IMainModel {
    
    func getAuthCode(number: Int, closure: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            DispatchQueue.main.async { 
                closure(Int.random(in: 0..<1000))
            }
        }
       
    }
}
