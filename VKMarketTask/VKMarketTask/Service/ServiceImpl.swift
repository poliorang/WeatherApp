//
//  ServiceImpl.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import Foundation

final class ServiceImpl: Service {
    
    static let shared = ServiceImpl()
    
    // MARK: - Private properties
    
    private let url = ""
    
    // MARK: - Init

    private init() { }
    
    // MARK: - Functions
    
    func getDataFromServer() async throws -> Data? {
//        let url = URL(string: url + type.request)!
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            print("Received data: \(data)")
//            return data
//        } catch {
//            print("Error fetching data: \(error)")
//            return nil
//        }
        return nil
    }
    
    func postDataToServer() async throws -> Data? {
        return nil
    }
}
