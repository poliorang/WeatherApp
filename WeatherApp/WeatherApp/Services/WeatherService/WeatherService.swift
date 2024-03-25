//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

enum RequestType {
    case weather
    case forecast
    
    var request: String {
        switch self {
        case .weather:
            return "/weather?"
        case .forecast:
            return "/forecast?"
        }
    }
}

protocol WeatherService: AnyObject {
    func getDataFromServer(lat: Double, lon: Double, requestType: RequestType) async throws -> Data?
}
