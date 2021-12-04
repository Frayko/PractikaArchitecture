//
//  MainController.swift
//  PractikaArchitecture
//
//  Created by Alexandr Evtodiy on 27.11.2021.
//

import UIKit

protocol IMainController: AnyObject {
    func authCodeButtonTouchUpInside()
    func logInButtonTouchUpInside()
    func dismissKeyboard()
}

class MainController: UIViewController {

    // MARK: Properties
    private var code: Int?
    var activeField: UITextField?
    private var model: IMainModel
    private var rootView: IMainView {
        self.view as? IMainView ?? MainView()
    }
    
    // MARK: - Structures
    struct Dependencies {
        let model: IMainModel
    }
    
    // MARK: - Init
    init(dependencies: Dependencies) {
        self.model = dependencies.model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycles
    override func loadView() {
        let rootView: IMainView = MainView()
        self.view = rootView
        self.rootView.loadView(controller: self as IMainController )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        rootView.showNumberFields()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }
    
    // MARK: - Navigation
    private func goToList() {
        
    }
    
    // MARK: - Keyboard
    private func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification){
        guard let info = notification.userInfo,
              let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        else { return }
        rootView.scrollView.isScrollEnabled = true
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0,
                                                        left: 0.0,
                                                        bottom: keyboardSize.height,
                                                        right: 0.0)
        
        rootView.scrollView.contentInset = contentInsets
        rootView.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize.height
        aRect.size.height -= 50.0
        
        if let activeField = activeField {
            if (!aRect.contains(activeField.frame.origin)){
                rootView.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification){
        guard let info = notification.userInfo,
              let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        else { return }
        
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0,
                                                        left: 0.0,
                                                        bottom: -keyboardSize.height,
                                                        right: 0.0)
        
        rootView.scrollView.contentInset = contentInsets
        rootView.scrollView.scrollIndicatorInsets = contentInsets
        
        rootView.endEditing(true)
        rootView.scrollView.isScrollEnabled = false
    }
    
}

extension MainController: IMainController {
    func authCodeButtonTouchUpInside() {
        guard let number = Int(rootView.getNumberTextField())
        else { return }
        model.getAuthCode(number: number) { [weak self] (code) in
            print(code)
            self?.code = code
            self?.rootView.showAllFields()
        }
    }
    
    func logInButtonTouchUpInside() {
        guard let code = Int(rootView.getAuthCodeTextField())
        else { return }
        if self.code == code {
            goToList()
        }
    }
    
    func dismissKeyboard() {
        rootView.endEditing(true)
    }
}
