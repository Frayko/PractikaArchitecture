//
//  ScreenThreeViewController.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import UIKit

final class ScreenThreeViewController: UIViewController {

    private var screenThreeView: IScreenThreeView
    private var screenThreeModel: ScreenThreeModel
	private let id: UUID
    
	init(id: UUID) {
		self.screenThreeModel = ScreenThreeModel()
		self.screenThreeView = ScreenThreeView(frame: .zero)
		self.id = id
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func loadView() {
        super.loadView()
        
		self.screenThreeView.loadView(controller: self)
		self.screenThreeModel.loadData(id: self.id)
		self.updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.screenThreeView.configureView()
		self.view = self.screenThreeView
    }
    
    func updateView() {
		let data = screenThreeModel.getData()

        screenThreeView.updateView(image: data.imageName,
                                   title: data.title,
                                   author: data.author,
                                   description: data.description)
    }
}
