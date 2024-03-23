//
//  TabControl.swift
//  VKMarketTask
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
    
    private enum Constants {
        static let fontSize: CGFloat = 14.0
        static let labelBackgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        static let labelBorderColor: CGColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.15)
        static let labelTextColor: UIColor = .white
    }
    
    // MARK: - Private functions
    
    private func setupLabels() {
        subviews.forEach { $0.removeFromSuperview() }
        showsHorizontalScrollIndicator = false

        var xOffset: CGFloat = 0

        for (_, labelText) in labels.enumerated() {
            let label = UILabel()
            label.isUserInteractionEnabled = true
            label.backgroundColor = Constants.labelBackgroundColor
            
            label.text = labelText
            label.font = UIFont(name: "PingFangSC-Semibold", size: 18)
            label.textAlignment = .center
            label.textColor = Constants.labelTextColor
            label.sizeToFit()
            
            label.layer.borderColor = Constants.labelBorderColor
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
