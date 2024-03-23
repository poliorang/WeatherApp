//
//  WeatherViewController.swift
//  VKMarketTask
//
//  Created by Polina Egorova on 21.03.2024.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Private properties
    
    private enum Constants {
//        static let cellIdentifier: String = "ActionsTableViewCell"
    }
    private let output: WeatherViewOutput
    private let tableViewDataSource: WeatherTableViewDataSource
    private var tableView: UITableView

    // MARK: - Init

    init(output: WeatherViewOutput,
         tableViewDataSource: WeatherTableViewDataSource
    ) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        self.tableView = UITableView().autolayout()
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpAppearance()
        updateTableView()
    }

    // MARK: - Private functions

    private func setUpUI() {
        view.backgroundColor = .red
    }
    
    private func setUpAppearance() {
    }
    
    private func updateTableView() {
//        output.setActions()
    }
}

extension WeatherViewController: WeatherViewInput {
//    func didGetActions(actions: [ActionModel]) {
//        if actions.isEmpty {
//            DispatchQueue.main.async {
//                self.emptyLabel.isHidden = false
//                self.tableView.isHidden = true
//            }
//            return
//        }
//        
//        DispatchQueue.main.async {
//            self.emptyLabel.isHidden = true
//            self.tableView.isHidden = false
//        }
//        tableViewDataSource.update(
//            with: actions,
//            tableView: tableView,
//            delegate: self
//        )
//    }
}

extension WeatherViewController: WeatherTableViewDataSourceDelegate {
    
}
