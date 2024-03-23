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
    private let colorManager = ColorManager.shared
    
    private let output: WeatherViewOutput
    private let tableViewDataSource: WeatherTableViewDataSource
    
    private var geoLabel: Label
    private var dateLabel: SecondaryLabel
    private var weatherImageView: UIImageView
    private var weatherDesriptionLabel: Label
    private var temperatureLabel: Label
    private var parametersTabControl: TabControl

    private var tableView: UITableView

    // MARK: - Init

    init(output: WeatherViewOutput,
         tableViewDataSource: WeatherTableViewDataSource
    ) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        
        self.geoLabel = Label().autolayout()
        self.dateLabel = SecondaryLabel.autolayout()
        self.weatherImageView = UIImageView().autolayout()
        self.weatherDesriptionLabel = Label().autolayout()
        self.temperatureLabel = Label().autolayout()
        self.parametersTabControl = TabControl().autolayout()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parametersTabControl.contentOffset.x = -20
    }

    // MARK: - Private functions

    private func setUpUI() {
        view.backgroundColor = colorManager.colorForKey(.primaryBackground)

        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 80),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(geoLabel)
        NSLayoutConstraint.activate([
            geoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            geoLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            geoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            geoLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImageView.topAnchor.constraint(equalTo: geoLabel.bottomAnchor, constant: 60),
            weatherImageView.heightAnchor.constraint(equalToConstant: 140),
            weatherImageView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        view.addSubview(weatherDesriptionLabel)
        NSLayoutConstraint.activate([
            weatherDesriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDesriptionLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 30),
            weatherDesriptionLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        view.addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: weatherDesriptionLabel.bottomAnchor, constant: 30),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        
        view.addSubview(parametersTabControl)
        NSLayoutConstraint.activate([
            parametersTabControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parametersTabControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parametersTabControl.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 30),
            parametersTabControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpAppearance() {
        geoLabel.text = "Moscow"
        dateLabel.text = "22.03.24"
        weatherImageView.image = UIImage(named: "SunCloudy")
        weatherDesriptionLabel.text = "Partly Cloudy"
        weatherDesriptionLabel.fontSize = 23
        temperatureLabel.text = "24°"
        temperatureLabel.fontSize = 48
        parametersTabControl.labels = ["wind: 3.0m/s", "humidity: 100%", "wind: 3.0m/s", "humidity: 100%", "wind: 3.0m/s", "humidity: 100%", "wind: 3.0m/s", "humidity: 100%"]
        parametersTabControl.contentInset.left = 20
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
