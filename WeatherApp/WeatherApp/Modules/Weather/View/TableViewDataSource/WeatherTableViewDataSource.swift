//
//  WeatherTableViewDataSource.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

protocol WeatherTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func update(with forecasts: [Forecast]?,
                tableView: UITableView,
                delegate: WeatherTableViewDataSourceDelegate
    )
}
