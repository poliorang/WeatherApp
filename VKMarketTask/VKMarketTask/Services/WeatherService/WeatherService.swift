//
//  WeatherService.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

protocol WeatherService: AnyObject {
    
    func getDataFromServer(lat: Double, lon: Double) async throws -> Data?
}
