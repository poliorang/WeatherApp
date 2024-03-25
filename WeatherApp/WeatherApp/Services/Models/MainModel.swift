//
//  MainModel.swift
//  WeatherApp
//
//  Created by Polina Egorova on 24.03.2024.
//

struct MainModel: Codable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let humidity: Int?
}
