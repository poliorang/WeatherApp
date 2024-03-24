//
//  WeatherDataModel.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 24.03.2024.
//

struct WeatherDataModel: Codable {
    let coord: CoordModel?
    let weather: [WeatherModel]?
    let main: MainModel?
    let visibility: Int?
    let wind: WindModel?
    let name: String?
    let cod: Int?
}
