//
//  WeatherInteractor.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

final class WeatherInteractor {
    private let service = ServiceImpl.shared
    weak var output: WeatherInteractorOutput?
}

extension WeatherInteractor: WeatherInteractorInput {

}
