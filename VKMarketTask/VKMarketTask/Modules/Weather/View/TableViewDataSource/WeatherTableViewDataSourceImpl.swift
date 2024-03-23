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
        static let cellIdentifier: String = "ActionsTableViewCell"
    }

    private weak var tableView: UITableView?
    private weak var delegate: WeatherTableViewDataSourceDelegate?

    // MARK: - Init
    
    override init() {
        super.init()
    }
}

extension WeatherTableViewDataSourceImpl: WeatherTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    func update(//with actions: [ActionModel],
                tableView: UITableView,
                delegate: WeatherTableViewDataSourceDelegate
    ) {
        self.tableView = tableView
        self.delegate = delegate

        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return actions?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? ActionsTableViewCell,
//            let actions = actions else {
//            assertionFailure("Failed to set tableview cell")
//            return UITableViewCell()
//        }
//
//        let action = actions[indexPath.row]
//        cell.configure(
//            action: action.name,
//            project: action.project_name,
//            delegate: delegate
//        )
//        cell.setUpUI()
//        cell.separatorInset = UIEdgeInsets.zero
//        cell.layoutMargins = UIEdgeInsets.zero
//        
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return Constants.cellHeight
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return Constants.cellHeight
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let action = actions?[indexPath.row] else { return }
//        delegate?.setSelectedAction(action: ActionProject(action.name, action.project_name))
//    }
}
