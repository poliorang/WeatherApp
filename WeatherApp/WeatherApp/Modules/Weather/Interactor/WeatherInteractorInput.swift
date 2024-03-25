//
//  WeatherInteractorInput.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

protocol WeatherInteractorInput: AnyObject {
    func updateLocation(_ cityName: String?)
    
    func updateCurrentLocation() 
}
