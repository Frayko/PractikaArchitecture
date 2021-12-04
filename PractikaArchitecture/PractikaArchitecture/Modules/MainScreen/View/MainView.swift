//
//  MainView.swift
//  PractikaArchitecture
//
//  Created by Alexandr Evtodiy on 27.11.2021.
//

import UIKit

protocol IMainView: UIView {
    var scrollView: UIScrollView { get set }
    
    func getNumberTextField() -> String
    func getAuthCodeTextField() -> String
    func showNumberFields()
    func showAllFields()
    func loadView(controller: IMainController)
}

final class MainView: UIView {
    
    // MARK: - Properties
    private weak var controller: IMainController?
    
    // MARK: - SubView
    private lazy var tapRootView: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.cancelsTouchesInView = false
        tap.addTarget(self, action: #selector(dismissKeyboardTapGestureRecognizer))
        return tap
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [numberTextField, authCodeTextField,
                                                  getAuthCodeButton, logInButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = AppLayout.Main.spacingStackView
        view.setCustomSpacing(AppLayout.Main.customSpacingAfterTextField,
                              after: authCodeTextField)
        view.backgroundColor = AppColors.background
        return view
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    } ()
    
    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
		textField.keyboardType = .numberPad
        textField.placeholder = AppText.Main.numberPlaceHolder
        textField.backgroundColor = AppColors.contentBackground
        textField.layer.masksToBounds = true
		textField.layer.borderWidth = AppLayout.Main.textFieldBorderWidth
		textField.layer.borderColor = AppColors.textFieldBorderColor
		textField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        textField.layer.cornerRadius = AppLayout.Main.cornerRadiusTextField
        return textField
    }()
    
    private lazy var authCodeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
		textField.keyboardType = .numberPad
        textField.placeholder = AppText.Main.authCodePlaceHolder
        textField.backgroundColor = AppColors.contentBackground
        textField.layer.masksToBounds = true
		textField.layer.borderWidth = AppLayout.Main.textFieldBorderWidth
		textField.layer.borderColor = AppColors.textFieldBorderColor
		textField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        textField.layer.cornerRadius = AppLayout.Main.cornerRadiusTextField
        return textField
    }()
    
    private let getAuthCodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get auth code", for: .normal)
        button.setTitleColor(AppColors.buttonTextColor, for: .normal)
        button.backgroundColor = AppColors.buttonColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = AppLayout.Main.cornerRadiusButton
        button.addTarget(self, action: #selector(authCodeButtonTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(AppColors.buttonTextColor, for: .normal)
        button.backgroundColor = AppColors.buttonColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = AppLayout.Main.cornerRadiusButton
        button.addTarget(self, action: #selector(logInButtonTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    private func configureUI() {
        backgroundColor = AppColors.background
    }
    
    private func configureLayout() {
        configureLayoutView()
        configureLayoutScrollView()
    }
    
    private func configureLayoutView() {
        let safeArea = safeAreaLayoutGuide
        addSubview(scrollView)
        addGestureRecognizer(tapRootView)
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                                                 constant: AppLayout.Main.leadingScrollView),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                                  constant: AppLayout.Main.trailingScrollView),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                                             constant: AppLayout.Main.topScrollView),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
        ])
    }
    
    private func configureLayoutScrollView() {
        let safeArea = scrollView.contentLayoutGuide
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            numberTextField.heightAnchor.constraint(equalToConstant: AppLayout.Main.heightTextField),
            authCodeTextField.heightAnchor.constraint(equalToConstant: AppLayout.Main.heightTextField),
            getAuthCodeButton.heightAnchor.constraint(equalToConstant: AppLayout.Main.heightButton),
            logInButton.heightAnchor.constraint(equalToConstant: AppLayout.Main.heightButton),
            
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                              constant: AppLayout.Main.bottomScrollView),
            
        ])
    }
    
    // MARK: - Action
    @objc private func authCodeButtonTouchUpInside() {
        self.controller?.authCodeButtonTouchUpInside()
    }
    
    @objc private func logInButtonTouchUpInside() {
        self.controller?.logInButtonTouchUpInside()
    }
    
    @objc private func dismissKeyboardTapGestureRecognizer() {
        self.controller?.dismissKeyboard()
    }
    
    @objc private func doneButtonAction() {
        self.controller?.dismissKeyboard()
    }
    
}

// MARK: - IMainView
extension MainView: IMainView {
    func getNumberTextField() -> String {
        guard let text = numberTextField.text else { return ""}
        return text
    }
    
    func getAuthCodeTextField() -> String {
        guard let text = authCodeTextField.text else { return ""}
        return text
    }
    
    func loadView(controller: IMainController) {
        self.controller = controller
    }
    
    func showNumberFields() {
        authCodeTextField.isEnabled = false
        authCodeTextField.backgroundColor = .clear
		authCodeTextField.layer.borderWidth = 0
        authCodeTextField.attributedPlaceholder = NSAttributedString(string: AppText.Main.authCodePlaceHolder,
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.clear])
        logInButton.isEnabled = false
        logInButton.backgroundColor = AppColors.background
        logInButton.setTitleColor(UIColor.clear, for: .normal)
        
    }
    
    func showAllFields() {
        authCodeTextField.isEnabled = true
        authCodeTextField.backgroundColor = AppColors.contentBackground
		authCodeTextField.layer.borderWidth = AppLayout.Main.textFieldBorderWidth
        authCodeTextField.attributedPlaceholder = NSAttributedString(string: AppText.Main.authCodePlaceHolder,
                                                                     attributes: [NSAttributedString.Key.foregroundColor: AppColors.placeHolderColor])
        logInButton.isEnabled = true
        logInButton.backgroundColor = AppColors.buttonColor
        logInButton.setTitleColor(AppColors.buttonTextColor, for: .normal)
    }
}
