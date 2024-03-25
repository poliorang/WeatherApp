//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {

    // MARK: - Private properties
    
    private let colorManager = ColorManager.shared
    
    private var dayLabel: Label
    private var weatherImageView: UIImageView
    private var maxTemperatureLabel: Label
    private var minTemperatureLabel: SecondaryLabel

    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.dayLabel = Label().autolayout()
        self.weatherImageView = UIImageView().autolayout()
        self.maxTemperatureLabel = Label().autolayout()
        self.minTemperatureLabel = SecondaryLabel().autolayout()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        contentView.backgroundColor = colorManager.colorForKey(.secondaryBackground)
    }
    
    override func prepareForReuse() {
        dayLabel.text = nil
        weatherImageView.image = nil
        minTemperatureLabel.text = nil
        maxTemperatureLabel.text = nil
    }
    
    // MARK: - Public functions
    
    public func setUpUI() {
        setupInitialLayout()
    }
    
    public func configure(forecast: Forecast?) {
        guard let forecast = forecast,
              let imageName = forecast.iconID.findMatchInDictionary(dictionary: Constants.imageNamesMatchAPI)else {
            dayLabel.text = Constants.emptyText
            minTemperatureLabel.text = Constants.emptyText
            maxTemperatureLabel.text = Constants.emptyText
            weatherImageView.image = UIImage(named: "Empty")
            return
        }
        dayLabel.text = forecast.dt.getDayOfWeek()
        minTemperatureLabel.text = "\(kelvinsInCelsius(kelvins: forecast.minTemterature))°"
        maxTemperatureLabel.text = "\(kelvinsInCelsius(kelvins: forecast.maxTemterature))°"
        weatherImageView.image = UIImage(named: imageName)
    }
    
    // MARK: - Private functions

    private func setupInitialLayout() {
        contentView.addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            dayLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -12),
            weatherImageView.heightAnchor.constraint(equalToConstant: 24),
            weatherImageView.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        contentView.addSubview(minTemperatureLabel)
        NSLayoutConstraint.activate([
            minTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            minTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            minTemperatureLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(maxTemperatureLabel)
        NSLayoutConstraint.activate([
            maxTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            maxTemperatureLabel.trailingAnchor.constraint(equalTo: minTemperatureLabel.leadingAnchor, constant: -20),
            maxTemperatureLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension WeatherTableViewCell {
    
    private func kelvinsInCelsius(kelvins: Double) -> Int {
        return Int(round(kelvins - Constants.kelvinConstant))
    }
}
