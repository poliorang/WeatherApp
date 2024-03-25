//
//  WeatherModuleAssembly.swift
//  WeatherApp
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

final class WeatherModuleAssembly {

    func module() -> UIViewController {
        
        let weatherService = WeatherServiceImpl()
        let locationManager = LocationManagerImpl()
        
        let interactor = WeatherInteractor(weatherService: weatherService,
                                           locationManager: locationManager)
        
        let presenter = WeatherPresenter(interactor: interactor)
        
        let tableViewDataSource = WeatherTableViewDataSourceImpl()
        
        let controller = WeatherViewController(
            output: presenter,
            tableViewDataSource: tableViewDataSource
        )

        presenter.view = controller
        interactor.output = presenter

        return controller
    }
}
