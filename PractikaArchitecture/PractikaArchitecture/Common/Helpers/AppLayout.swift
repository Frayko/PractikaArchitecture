//
//  AppLayout.swift
//  PractikaArchitecture
//
//  Created by Alexandr Evtodiy on 27.11.2021.
//

import UIKit

enum AppLayout {

    enum Main {
        static let cornerRadiusTextField: CGFloat = 8.0
        static let cornerRadiusButton: CGFloat = 25.0
        
        static let heightTextField: CGFloat = 50.0
        static let heightButton: CGFloat = 50.0
		
		static let textFieldBorderWidth: CGFloat = 0.5
        
        // MARK: - StackView
        static let topScrollView: CGFloat = 32.0
        static let leadingScrollView: CGFloat = 9.0
        static let trailingScrollView: CGFloat = -leadingScrollView
        static let bottomScrollView: CGFloat = -100
        
        // MARK: - StackView
        static let spacingStackView: CGFloat = 9.0
        static let customSpacingAfterTitleLabel: CGFloat = 32.0
        static let customSpacingAfterTextField: CGFloat = 39.0
}
}
