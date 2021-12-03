//
//  ScreenThreeViewController.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import UIKit

final class ScreenThreeViewController: UIViewController {

    private var screenThreeView: ScreenThreeView?
    private var screenThreeModel: ScreenThreeModel?
    
    override func loadView() {
        super.loadView()
        
        self.screenThreeModel = ScreenThreeModel()
        self.screenThreeView = ScreenThreeView(frame: view.bounds)
        screenThreeView?.loadView(controller: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        screenThreeView?.configureView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.screenThreeView?.backgroundColor = .white
        guard let screenThreeView = screenThreeView else {
            return
        }
        view.addSubview(screenThreeView)
    }
    
    func updateView() {
        guard let screenThreeView = screenThreeView else {return}
        guard let screenThreeModel = screenThreeModel else {return}
        
        //screenThreeModel.updateData(data: <#T##[String]#>)
        //let viewModel = screenThreeModel.getData()
        //screenThreeView.updateView(image: , title: , author: , description: )
    }
    


}
