//
//  Label.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

class Label: UILabel {
    
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
        textColor = .white
        clipsToBounds = true
        textAlignment = .left
    }
}
