//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

final class WeatherPresenter {
    
    weak var view: WeatherViewInput?

    // MARK: - Private properties
    
    private let interactor: WeatherInteractorInput
    
    // MARK: - Init

    init(interactor: WeatherInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Private functions
    
    private func setUpDateLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)

        view?.configureDateLabel(text: formattedDate)
    }
    
    private func convertParamsForUI(_ weatherParameters: Weather) -> (temterature: String, params: [String], imageName: String) {
        let temterature = " \(kelvinsInCelsius(kelvins: weatherParameters.temterature))°"
        var params = [String]()
        
        if let speed = weatherParameters.speed {
            params.append("wind: \(speed)m/s")
        }
        
        if let humidity = weatherParameters.humidity {
            params.append("humidity: \(humidity)%")
        }
        
        if let pressure = weatherParameters.pressure {
            params.append("pressure: \(pressure)hPa")
        }
        
        if let visibility = weatherParameters.visibility {
            params.append("visibility: \(visibility)m")
        }
        
        let imageName = weatherParameters.iconID.findMatchInDictionary(dictionary: Constants.imageNamesMatchAPI) ?? Constants.emptyImageName

        return (temterature, params, imageName)
    }
}

extension WeatherPresenter: WeatherViewOutput {
    func setUpDate() {
        setUpDateLabel()
    }
    
    func updateLocation(_ cityName: String?) {
        interactor.updateLocation(cityName)
    }
    
    func updateCurrentLocation() {
        interactor.updateCurrentLocation()
    }
}

extension WeatherPresenter: WeatherInteractorOutput {
    
    func setUpLocation(location: String?) {
        guard let location = location else {
            view?.configureLocationLabel(text: Constants.emptyText)
            return
        }
        view?.configureLocationLabel(text: location)
    }
    
    func setUpWeatherParameters(data: Weather?) {
        guard let weatherParameters = data else {
              DispatchQueue.main.async { [weak self] in
                  self?.view?.configureUI(description: Constants.emptyText,
                                          temterature: Constants.emptyText,
                                          params: [],
                                          imageName: Constants.emptyImageName
                  )
              }
            return
        }
        
        let (temterature, params, imageName) = convertParamsForUI(weatherParameters)
        DispatchQueue.main.async { [weak self] in
            self?.view?.configureUI(description: weatherParameters.description,
                                    temterature: temterature,
                                    params: params,
                                    imageName: imageName
            )
        }
    }
    
    func setUpForecastParameters(data: [Forecast]?) {
        guard let forecastParameters = data else {
            DispatchQueue.main.async { [weak self] in
                self?.view?.configureTableView(forecasts: nil)
            }
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.configureTableView(forecasts: forecastParameters)
        }
    }
    
    func didIncorrectLocation() {
        view?.didIncorrectLocation() 
    }
}

extension WeatherPresenter {
    private func kelvinsInCelsius(kelvins: Double) -> Double {
        return round(10 * (kelvins - Constants.kelvinConstant)) / 10
    }
}

