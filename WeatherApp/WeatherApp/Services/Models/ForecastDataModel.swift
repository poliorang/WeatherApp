//
//  ForecastDataModel.swift
//  WeatherApp
//
//  Created by Polina Egorova on 24.03.2024.
//

struct ForecastDataModel: Codable {
    let cod: String?
    let cnt: Int?
    let list: [WeatherDataModel]?
}
