//
//  Weather.swift
//  VKMarketTask
//
//  Created by Поли Оранж on 24.03.2024.
//

struct Weather {
    let main: String
    let description: String
    let temterature: Double
    let speed: Double
    let visibility: Int
    let pressure: Int
    let humidity: Int
}

extension Weather {
    static func fromWeatherDataModel(_ model: WeatherDataModel) -> Weather? {
        guard let main = model.weather?[0].main,
              let description = model.weather?[0].main,
              let temterature = model.main?.temp,
              let speed = model.wind?.speed,
              let visibility = model.visibility,
              let pressure = model.main?.pressure,
              let humidity = model.main?.humidity else {
            return nil
        }
        return Weather(main: main,
                       description: description,
                       temterature: temterature,
                       speed: speed,
                       visibility: visibility,
                       pressure: pressure,
                       humidity: humidity)
    }
}
