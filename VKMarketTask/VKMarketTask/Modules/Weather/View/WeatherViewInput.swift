//
//  WeatherViewInput.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

protocol WeatherViewInput: AnyObject {
    func setUpLocationLabel(text: String)
    
    func setUpDateLabel(text: String)
    
    func setUpDesriptionLabel(text: String)
    
    func setUpTemperatureLabel(text: String)
    
    func setUpParametersTabControl(params: [String])
    
    func setUpImageView(imageName: String)
}
