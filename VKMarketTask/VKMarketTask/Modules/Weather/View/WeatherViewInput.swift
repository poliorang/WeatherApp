//
//  WeatherViewInput.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

protocol WeatherViewInput: AnyObject {
    func configureLocationLabel(text: String)
    
    func configureDateLabel(text: String)
    
    func configureUI(description: String, temterature: String, params: [String], imageName: String)
    
    func configureTableView(forecasts: [Forecast]?)
    
    func didIncorrectLocation()
}
