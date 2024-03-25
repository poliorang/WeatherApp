//
//  Button.swift
//  WeatherApp
//
//  Created by Polina Egorova on 25.03.2024.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    func searchButtonTapped()
    func locationButtonTapped()
}

final class Button: UIButton {
    
    weak var delegate: ButtonDelegate?

    enum ButtonState {
        case search
        case location
        
        var image: UIImage {
            switch self {
            case .search:
                return UIImage(systemName: "magnifyingglass")!
            case .location:
                return UIImage(systemName: "location")!
            }
        }
        
    }
    
    // MARK: - Public properties
    
    public var buttonState: ButtonState = .search {
        didSet {
            self.setImage(buttonState.image, for: .normal)
        }
    }
    
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
    
    // MARK: - Private functions
    
    private func setUpUI() {
        tintColor = colorManager.colorForKey(.primaryText)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
            
    // MARK: - Button Actions
            
    @objc private func buttonTapped() {
        switch buttonState {
        case .search:
            delegate?.searchButtonTapped()
        case .location:
            delegate?.locationButtonTapped()
        }
    }
}
