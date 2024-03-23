//
//  SecondaryLabel.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

class SecondaryLabel: UILabel {

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
        textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.68)
        font = UIFont(name: "PingFangSC", size: 18)
        clipsToBounds = true
        textAlignment = .left
    }
}

