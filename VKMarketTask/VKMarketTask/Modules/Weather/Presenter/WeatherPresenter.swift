//
//  WeatherPresenter.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

final class WeatherPresenter {
    
    weak var view: WeatherViewInput?

    // MARK: - Private properties

    private let interactor: WeatherInteractorInput

    // MARK: - Init

    init(interactor: WeatherInteractorInput) {
        self.interactor = interactor
    }
}

extension WeatherPresenter: WeatherViewOutput {

}

extension WeatherPresenter: WeatherInteractorOutput {

}

extension WeatherPresenter: WeatherModuleInput {

}
