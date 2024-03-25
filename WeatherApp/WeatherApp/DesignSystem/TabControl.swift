//
//  TabControl.swift
//  WeatherApp
//
//  Created by Polina Egorova on 23.03.2024.
//

import UIKit

final class TabControl: UIScrollView {

    // MARK: - Public properties
    
    public var labels: [String] = [] {
        didSet {
            setupLabels()
        }
    }
    
    // MARK: - Private properties
    
    private let colorManager = ColorManager.shared
    
    
    // MARK: - Private functions
    
    private func setupLabels() {
        subviews.forEach { $0.removeFromSuperview() }
        showsHorizontalScrollIndicator = false

        var xOffset: CGFloat = 0

        for (_, labelText) in labels.enumerated() {
            let label = UILabel()
            label.isUserInteractionEnabled = true
            label.backgroundColor = colorManager.colorForKey(.secondaryBackground)
            
            label.text = labelText
            label.font = UIFont(name: "PingFangSC-Semibold", size: 18)
            label.textAlignment = .center
            label.textColor = colorManager.colorForKey(.primaryText)
            label.sizeToFit()
            
            label.layer.borderColor = colorManager.colorForKey(.primaryBorder).cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = min(label.frame.height, label.frame.width) - 4
            label.clipsToBounds = true
            
            label.frame = CGRect(x: xOffset, y: 0, width: label.frame.size.width + 32, height: 40)
            self.addSubview(label)

            xOffset += label.frame.size.width + 10
        }
    
        contentSize = CGSize(width: xOffset, height: 32)
    }
}
