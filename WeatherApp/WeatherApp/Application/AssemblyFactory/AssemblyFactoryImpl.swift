//
//  AssemblyFactoryImpl.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 22.03.2024.
//

final class AssemblyFactoryImpl {

    static let shared = AssemblyFactoryImpl()

    // MARK: - Private properties

    private let _weatherModuleAssembly = WeatherModuleAssembly()
    
    // MARK: - Init

    private init() { }
}

extension AssemblyFactoryImpl: AssemblyFactory {
    func weatherModuleAssembly() -> WeatherModuleAssembly {
        return _weatherModuleAssembly
    }
}


