//
//  Forecast.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 24.03.2024.
//

struct Forecast {
    let dt: Int
    let minTemterature: Double
    let maxTemterature: Double
    let iconID: String
}

extension Forecast {
    static func fromForecastDataModel(model: ForecastDataModel, index: Int) -> Forecast? {
        guard let dt = model.list?[index * 8].dt,
              let minTemterature = model.list?[index * 8].main?.temp_min,
              let maxTemterature = model.list?[index * 8].main?.temp_max,
              let iconID = model.list?[index * 8].weather?[0].icon else {
            return nil
        }

        return Forecast(dt: dt,
                        minTemterature: minTemterature,
                        maxTemterature: maxTemterature,
                        iconID: iconID)
    }
}
