//
//  ScreenThreeView.swift
//  PractikaArchitecture
//
//  Created by pavel on 3.12.21.
//

import UIKit

final class ScreenThreeView: UIView {

    private weak var vc: ScreenThreeViewController?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica Bold", size: 24)
        label.text = "Post Title Here..."
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica Bold", size: 16)
        label.text = "Author"
        return label
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Helvetica", size: 16)
        textView.textColor = UIColor.darkGray
        textView.isEditable = false
        textView.text = "Description here..."
        return textView
    }()
    
    func configureView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(descriptionTextView)
        
        setupImageViewAutoLayout()
        setupTitleLabelAutoLayout()
        setupAuthorLabelAutoLayout()
        setupDescriptionTextViewAutoLayout()
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
    
    private func setupImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 76),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 196)
        ])
    }
    
    private func setupTitleLabelAutoLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    private func setupAuthorLabelAutoLayout() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    private func setupDescriptionTextViewAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
