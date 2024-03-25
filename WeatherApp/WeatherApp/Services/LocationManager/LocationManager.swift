//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Polina Egorova 23.03.2024.
//

import CoreLocation

protocol LocationManager: AnyObject {
    func getUserLocationCoordinates(completion: @escaping ((CLLocation) -> Void))
    
    func stopUpdatingLocation()
    
    func getCityNameFromCoordinates(latitude: Double?, longitude: Double?,
                                    completion: @escaping (String?) -> Void)
    
    func getCoordinatesFromCityName(cityName: String?,
                                    completion: @escaping (Double?, Double?) -> Void)
}
