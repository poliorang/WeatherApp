//
//  TextField.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 24.03.2024.
//

import UIKit

class TextField: UITextField {
    
    // MARK: - Private properties
    
    private let colorManager = ColorManager.shared
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
        addSearchIcon()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
        addSearchIcon()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 25, dy: 0)
    }
    
    // MARK: - Private functions
    
    private func setupTextField() {
        self.backgroundColor = .clear
        textColor = colorManager.colorForKey(.primaryText)
        autocorrectionType = .no
    }
    
    private func addSearchIcon() {
        let searchIconImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIconImageView.contentMode = .scaleAspectFit
        searchIconImageView.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        searchIconImageView.tintColor = colorManager.colorForKey(.primaryText)
        
        leftView = searchIconImageView
        leftViewMode = .always
    }
}
