//
//  WeatherInteractorOutput.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

protocol WeatherInteractorOutput: AnyObject {
    func setUpLocation(location: String?)
    
    func setUpWeatherParameters(data: WeatherDataModel?)
}
