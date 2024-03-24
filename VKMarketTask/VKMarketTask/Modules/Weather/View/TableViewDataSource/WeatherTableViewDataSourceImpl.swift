//
//  WeatherTableViewDataSourceImpl.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

protocol WeatherTableViewDataSourceDelegate: AnyObject {
    
}

final class WeatherTableViewDataSourceImpl: NSObject {
    
    // MARK: - Private properties
    
    private enum Constants {
        static let cellIdentifier: String = "WeatherTableViewCell"
        static let cellHeight: CGFloat = 50
    }
    
    private let colorManager = ColorManager.shared
    
    private var forecasts: [Forecast]?
    private weak var tableView: UITableView?
    private weak var delegate: WeatherTableViewDataSourceDelegate?

    // MARK: - Init
    
    override init() {
        super.init()
    }
    
    private func setupTableAppearance() {
        tableView?.backgroundColor = colorManager.colorForKey(.secondaryBackground)
        tableView?.layer.borderColor = colorManager.colorForKey(.primaryBorder).cgColor
        tableView?.layer.borderWidth = 1
        tableView?.layer.cornerRadius = 16
        tableView?.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
    }
}

extension WeatherTableViewDataSourceImpl: WeatherTableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? WeatherTableViewCell else {
            assertionFailure("Failed to set tableview cell")
            return UITableViewCell()
        }
        
        let forecast = forecasts?[indexPath.row]
        cell.configure(forecast: forecast)
        cell.setUpUI()
        
        return cell
    }
    

    func update(with forecasts: [Forecast]?,
                tableView: UITableView,
                delegate: WeatherTableViewDataSourceDelegate
    ) {
        self.forecasts = forecasts
        self.tableView = tableView
        self.delegate = delegate
        
        setupTableAppearance()
    
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
}
