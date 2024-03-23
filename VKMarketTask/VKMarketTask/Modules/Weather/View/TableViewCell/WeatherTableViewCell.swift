//
//  WeatherTableViewCell.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private enum Constants {
//        static let fontSize: CGFloat = 16.0
    }
    
    private weak var delegate: WeatherTableViewDataSourceDelegate?

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpUI() {
        setupInitialLayout()
        configureView()
    }
    
    public func configure() {
    }

    override func prepareForReuse() {
    }
    
    // MARK: - Private functions

    private func setupInitialLayout() {
    }

    private func configureView() {
    }
}



