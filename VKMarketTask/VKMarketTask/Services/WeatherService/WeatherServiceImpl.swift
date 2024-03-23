//
//  WeatherServiceImpl.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

final class WeatherServiceImpl: WeatherService {

    // MARK: - Private properties
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?"
    private let key = "&APPID=0734ac386bba0d8e6293d833d1466b1c"
    
    // MARK: - Init

    init() { }
    
    // MARK: - Public functions
    
    public func getDataFromServer(lat: Double, lon: Double) async throws -> Data? {
        let url = URL(string: url + key + "&lat=\(lat)&lon=\(lon)")!
        print(url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let weatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
            return data
        } catch {
            print("Error fetching data: \(error)")
            return nil
        }
    }
}
