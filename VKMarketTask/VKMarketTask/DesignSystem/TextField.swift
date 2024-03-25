//
//  TextField.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 24.03.2024.
//

import UIKit

final class TextField: UITextField {

    // MARK: - Private properties

    private let colorManager = ColorManager.shared
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: 0)
    }

    
    // MARK: - Private functions
    
    private func setUpUI() {
        self.backgroundColor = .clear
        textColor = colorManager.colorForKey(.primaryText)
        autocorrectionType = .no
    }
}
