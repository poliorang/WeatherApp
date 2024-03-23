//
//  Service.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

protocol Service: AnyObject {
    
    func getDataFromServer() async throws -> Data?
    
    func postDataToServer() async throws -> Data?
}
