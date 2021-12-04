//
//  ScreenThreeView.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import UIKit

protocol IScreenThreeView: UIView {
	func configureView()
	func loadView(controller: ScreenThreeViewController)
	func updateView(image: String, title: String, author: String, description: String)
}

final class ScreenThreeView: UIView {
    private weak var vc: ScreenThreeViewController?
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.layer.masksToBounds = true
		return scrollView
	}()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
		textView.font = .systemFont(ofSize: 16)
        textView.textColor = .darkGray
        textView.isEditable = false
		textView.textContainerInset = .zero
		textView.textContainer.lineFragmentPadding = 0
		textView.isSelectable = true
		textView.isScrollEnabled = false
        return textView
    }()
}
    
extension ScreenThreeView: IScreenThreeView {
    func configureView() {
		self.backgroundColor = .systemBackground
		
		self.addSubview(self.scrollView)
		self.scrollView.addSubview(imageView)
		self.scrollView.addSubview(titleLabel)
		self.scrollView.addSubview(authorLabel)
		self.scrollView.addSubview(descriptionTextView)
        
        setupImageViewAutoLayout()
        setupTitleLabelAutoLayout()
        setupAuthorLabelAutoLayout()
        setupDescriptionTextViewAutoLayout()
		setupScrollView()
    }
    
    func loadView(controller: ScreenThreeViewController) {
        self.vc = controller
    }
    
    func updateView(image: String, title: String, author: String, description: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        authorLabel.text = author
        descriptionTextView.text = description
    }
}

private extension ScreenThreeView {
    func setupImageViewAutoLayout() {
		let scrollArea = self.scrollView.contentLayoutGuide
		
        NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: scrollArea.topAnchor, constant: 24),
			imageView.leftAnchor.constraint(equalTo: scrollArea.leftAnchor, constant: 16),
			imageView.rightAnchor.constraint(equalTo: scrollArea.rightAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 196)
        ])
    }
    
    func setupTitleLabelAutoLayout() {
		let scrollArea = self.scrollView.contentLayoutGuide
		
        NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 32),
            titleLabel.leftAnchor.constraint(equalTo: scrollArea.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: scrollArea.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    func setupAuthorLabelAutoLayout() {
		let scrollArea = self.scrollView.contentLayoutGuide
		
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leftAnchor.constraint(equalTo: scrollArea.leftAnchor, constant: 16),
            authorLabel.rightAnchor.constraint(equalTo: scrollArea.rightAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    func setupDescriptionTextViewAutoLayout() {
		let scrollArea = self.scrollView.contentLayoutGuide
		
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            descriptionTextView.leftAnchor.constraint(equalTo: scrollArea.leftAnchor, constant: 16),
            descriptionTextView.rightAnchor.constraint(equalTo: scrollArea.rightAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(equalTo: scrollArea.bottomAnchor, constant: -16)
        ])
    }
	
	func setupScrollView() {
		let safeArea = self.safeAreaLayoutGuide

		NSLayoutConstraint.activate([
			scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: safeArea.topAnchor),
			scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
			scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
			scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
			scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor)
		])
	}
}
