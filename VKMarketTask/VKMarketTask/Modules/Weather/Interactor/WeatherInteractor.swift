//
//  WeatherInteractor.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation
import CoreLocation

final class WeatherInteractor {
    
    weak var output: WeatherInteractorOutput?
    
    // MARK: - Private properties
    private var userLatitude: CLLocationDegrees?
    private var userLongitude: CLLocationDegrees?
    private var userLocation: CLLocation? {
        didSet {
            userLatitude = userLocation?.coordinate.latitude
            userLongitude = userLocation?.coordinate.longitude
        }
    }
    
    private let weatherService: WeatherService
    private let locationManager: LocationManager

    // MARK: - Init
    
    init(weatherService: WeatherService,
         locationManager: LocationManager) {
        self.weatherService = weatherService
        self.locationManager = locationManager
    
        initLocation()
    }
    
    // MARK: - Private Properties
    
    private func initLocation() {
        locationManager.getUserLocationCoordinates { [weak self] location in
            self?.userLocation = location
            self?.initData()
            self?.locationManager.getCityNameFromCoordinates(latitude: self?.userLatitude,
                                                             longitude: self?.userLongitude) { cityName in
                self?.output?.setUpLocation(location: cityName)
            }
        }
    }
    
    private func initData() {
        Task {
            guard let data = try await weatherService.getDataFromServer(lat: userLatitude ?? 0, lon: userLongitude ?? 0) else {
                print("error")
                return
            }
            let weatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
            output?.setUpWeatherParameters(data: weatherData)
        }
    }
}

extension WeatherInteractor: WeatherInteractorInput {

}
