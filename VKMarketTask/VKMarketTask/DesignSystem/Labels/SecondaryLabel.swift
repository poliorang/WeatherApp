//
//  SecondaryLabel.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

class SecondaryLabel: UILabel {

    // MARK: - Private properties
    
    private let colorManager = ColorManager.shared
    
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
        textColor = colorManager.colorForKey(.secondaryText)
        font = UIFont(name: "PingFangSC", size: 18)
        clipsToBounds = true
        textAlignment = .left
    }
}

