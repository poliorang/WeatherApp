//
//  WeatherPresenter.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

final class WeatherPresenter {
    
    weak var view: WeatherViewInput?

    // MARK: - Private properties
    
    private let interactor: WeatherInteractorInput
    
    private enum Constants {
        static let dateFormat: String = "yy.MM.dd"
        static let emptyText: String = "- - - -"
        static let kelvinConstant: Double = 273.15
    }
    
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

        view?.setUpDateLabel(text: formattedDate)
    }
    
    private func kelvinsInCelsius(kelvins: Double) -> Double {
        return round(10 * (kelvins - Constants.kelvinConstant)) / 10
    }
}

extension WeatherPresenter: WeatherViewOutput {
    func setUpDate() {
        setUpDateLabel()
    }
}

extension WeatherPresenter: WeatherInteractorOutput {
    
    func setUpLocation(location: String?) {
        guard let location = location else {
            view?.setUpLocationLabel(text: Constants.emptyText)
            return
        }
        view?.setUpLocationLabel(text: location)
    }
    
    func setUpWeatherParameters(data: WeatherDataModel?) {
        guard let model = data,
              let weatherParameters = Weather.fromWeatherDataModel(model) else {
              DispatchQueue.main.async { [weak self] in
                  self?.view?.setUpDesriptionLabel(text: Constants.emptyText)
                  self?.view?.setUpTemperatureLabel(text: Constants.emptyText)
                  self?.view?.setUpParametersTabControl(params: [])
              }
            return
        }
        
        
        let temterature = " \(kelvinsInCelsius(kelvins: weatherParameters.temterature))°"
        let params: [String] = ["wind: \(weatherParameters.speed)m/s",
                                "humidity: \(weatherParameters.humidity)%",
                                "pressure: \(weatherParameters.pressure)hPa",
                                "visibility: \(weatherParameters.visibility)m"]
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.setUpDesriptionLabel(text: weatherParameters.description)
            self?.view?.setUpTemperatureLabel(text: temterature)
            self?.view?.setUpParametersTabControl(params: params)
        }
    }
}

extension WeatherPresenter: WeatherModuleInput {

}
