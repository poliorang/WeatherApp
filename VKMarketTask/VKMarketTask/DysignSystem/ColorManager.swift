//
//  ColorManager.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

enum ColorKey {
    case primaryBackground
    case secondaryBackground
    case primaryText
    case secondaryText
    case primaryBorder
}

class ColorManager {
    
    static let shared = ColorManager()
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Private properties
    
    private let primaryBackgroundColor: UIColor = UIColor(red: 29/255, green: 40/255, blue: 55/255, alpha: 1.0)
    private let secondaryBackgroundColor: UIColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
    private let primaryTextColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    private let secondaryTextColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.68)
    private let primaryBorderColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.15)
    
    // MARK: - Public functions
    
    public func colorForKey(_ key: ColorKey) -> UIColor {
        switch key {
        case .primaryBackground:
            return primaryBackgroundColor
        case .secondaryBackground:
            return secondaryBackgroundColor
        case .primaryText:
            return primaryTextColor
        case .secondaryText:
            return secondaryTextColor
        case .primaryBorder:
            return primaryBorderColor
        }
    }
}

