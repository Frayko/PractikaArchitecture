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

    private var data: [Feed]?
    
    
    override func loadView() {
        super.loadView()
        
        self.screenThreeModel = ScreenThreeModel()
        self.screenThreeView = ScreenThreeView(frame: view.bounds)
        screenThreeView?.loadView(controller: self)

        screenThreeModel?.loadId(id: UUID())
        data = Feeds.getFeeds() //1 get data
        
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
        
        updateView()
    }
    
    func updateView() {
        guard let screenThreeView = screenThreeView else {return}
        guard let screenThreeModel = screenThreeModel else {return}
        
        guard let data = data else {return }
        screenThreeModel.updateData(data: data) //2 update model data
        //3 get new data
        
        //4 update view
        screenThreeView.updateView(image: data.first?.imageName ?? "",
                                   title: data.first?.title ?? "",
                                   author: data.first?.author ?? "",
                                   description: data.first?.description_max ?? "")
        
        //let viewModel = screenThreeModel.getData() //3 get new data
    }
}
