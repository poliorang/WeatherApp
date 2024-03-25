//
//  Constants.swift
//  WeatherApp
//
//  Created by Polina Egorova on 25.03.2024.
//

enum Constants {
    static let dateFormat: String = "dd.MM.yy"
    static let emptyText: String = "- - - -"
    static let emptyImageName: String = "Empty"
    static let kelvinConstant: Double = 273.15
    static let imageNamesMatchAPI: [String : String] = [
        "01" : "Clear", "02" : "FewClouds", "03" : "Clouds",
        "04" : "BrokenClouds", "09" : "ShowerRain", "10" : "Rain",
        "11" : "Thunderstorm", "13" : "Snow", "50" : "Mist"]
    
}

