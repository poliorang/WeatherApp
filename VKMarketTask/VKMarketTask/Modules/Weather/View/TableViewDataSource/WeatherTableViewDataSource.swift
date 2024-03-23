//
//  WeatherTableViewDataSource.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

protocol WeatherTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func update(//with actions: [ActionModel],
                tableView: UITableView,
                delegate: WeatherTableViewDataSourceDelegate
    )
}
