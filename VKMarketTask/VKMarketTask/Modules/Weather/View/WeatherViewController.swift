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
    
    private var locationLabel: Label
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
        
        self.locationLabel = Label().autolayout()
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
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            locationLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImageView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 60),
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
        weatherDesriptionLabel.fontSize = 23
        temperatureLabel.fontSize = 48
        parametersTabControl.contentInset.left = 20
        
        output.setUpDate()
    }
    
    private func updateTableView() {
//        output.setActions()
    }
}

extension WeatherViewController: WeatherViewInput {
    func setUpLocationLabel(text: String) {
        locationLabel.text = text
    }
    
    func setUpDateLabel(text: String) {
        dateLabel.text = text
    }
    
    func setUpDesriptionLabel(text: String) {
        weatherDesriptionLabel.text = text
    }
    
    func setUpTemperatureLabel(text: String) {
        temperatureLabel.text = text
    }
    
    func setUpParametersTabControl(params: [String]) {
        parametersTabControl.labels = params
    }
    
    func setUpImageView(imageName: String) {
        weatherImageView.image = UIImage(named: imageName)
    }
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
