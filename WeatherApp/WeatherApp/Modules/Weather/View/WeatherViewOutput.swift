//
//  WeatherViewOutput.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

protocol WeatherViewOutput: AnyObject {
    func setUpDate()
    
    func updateLocation(_ cityName: String?)
    
    func updateCurrentLocation() 
}

