//
//  Label.swift
//  WeatherApp
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

final class Label: UILabel {
    
    // MARK: - Private properties
    
    private let colorManager = ColorManager.shared
    
    // MARK: - Public properties
    
    var fontSize: CGFloat = 18 {
        didSet {
            font = UIFont(name: "PingFangSC-Medium", size: fontSize)
        }
    }

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        textColor = colorManager.colorForKey(.primaryText)
        clipsToBounds = true
        textAlignment = .left
    }
}
