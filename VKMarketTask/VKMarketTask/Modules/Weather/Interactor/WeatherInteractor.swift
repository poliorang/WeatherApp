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
    
    private enum Constants {
        static let daysCnt: Int = 5
    }
    
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

    private var staticticMin = 0.0
    private var staticticMax = 0.0
    private var staticticIcon: String = "Empty"

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
            self?.initWeather()
            self?.initForecast()
            
            self?.locationManager.getCityNameFromCoordinates(latitude: self?.userLatitude,
                                                             longitude: self?.userLongitude) {
                [weak self] cityName in
                self?.output?.setUpLocation(location: cityName)
                self?.locationManager.stopUpdatingLocation()
            }
        }
    }

    private func initWeather() {
        Task {
            guard let data = try await weatherService.getDataFromServer(
                lat: userLatitude ?? 0,
                lon: userLongitude ?? 0,
                requestType: .weather
            ) else {
                output?.setUpWeatherParameters(data: nil)
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                if (weatherData.cod ?? 0) / 100 != 2 {
                    output?.setUpWeatherParameters(data: nil)
                    return
                }
                let weatherParameters = Weather.fromWeatherDataModel(weatherData)
                output?.setUpWeatherParameters(data: weatherParameters)
            } catch {
                output?.setUpWeatherParameters(data: nil)
            }
        }
    }

    private func initForecast() {
        Task {
            guard let data = try await weatherService.getDataFromServer(
                lat: userLatitude ?? 0,
                lon: userLongitude ?? 0,
                requestType: .forecast
            ) else {
                output?.setUpForecastParameters(data: nil)
                return
            }
            
            do {
                let forecastData = try JSONDecoder().decode(ForecastDataModel.self, from: data)
                if (Int(forecastData.cod ?? "0") ?? 0) / 100 != 2 {
                    output?.setUpForecastParameters(data: nil)
                    return
                }
                output?.setUpForecastParameters(data: getForecasts(forecastData))
            } catch {
                output?.setUpForecastParameters(data: nil)
            }
        }
    }
    
    private func getForecasts(_ forecastData: ForecastDataModel) -> [Forecast]? {
        var forecastParameters = [Forecast]()
        
        staticticMin = 0
        staticticMax = 0
        staticticIcon = "Empty"
        
        for i in 0..<Constants.daysCnt {
            guard let forecast = Forecast.fromForecastDataModel(model: forecastData, index: i) else {
                output?.setUpForecastParameters(data: nil)
                return nil
            }
            saveStatistics(forecast)
            forecastParameters.append(forecast)
        }
        for _ in 0..<2 {
            forecastParameters.append(createExtraForecast(dt: forecastParameters.last!.dt))
        }
        
        return forecastParameters
    }

    private func saveStatistics(_ forecast: Forecast) {
        staticticMin += forecast.minTemterature
        staticticMax += forecast.maxTemterature
        staticticIcon = forecast.iconID
    }

    private func createExtraForecast(dt: Int) -> Forecast {
        return Forecast(dt: dt.nextDayOfWeek() ?? dt, minTemterature: staticticMin / Double(Constants.daysCnt), maxTemterature: staticticMax / Double(Constants.daysCnt), iconID: staticticIcon)
    }
}

extension WeatherInteractor: WeatherInteractorInput {
    func updateLocation(_ cityName: String?) {
        locationManager.getCoordinatesFromCityName(cityName: cityName) { [weak self] lat, lon in
            guard let lat = lat, let lon = lon else {
                self?.output?.didIncorrectLocation()
                return
            }
            
            self?.locationManager.getCityNameFromCoordinates(latitude: lat,
                                                             longitude: lon) {
                [weak self] cityName in
                self?.output?.setUpLocation(location: cityName)
            }
                
                
            self?.userLatitude = lat
            self?.userLongitude = lon
            self?.initWeather()
            self?.initForecast()
        }
    }
    
    func updateCurrentLocation() {
        initLocation()
    }
}
