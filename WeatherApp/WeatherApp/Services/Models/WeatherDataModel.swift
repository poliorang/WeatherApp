//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Polina Egorova on 24.03.2024.
//

struct WeatherDataModel: Codable {
    let coord: CoordModel?
    let weather: [WeatherModel]?
    let main: MainModel?
    let visibility: Int?
    let wind: WindModel?
    let dt: Int?
    let name: String?
    let cod: Int?
}
