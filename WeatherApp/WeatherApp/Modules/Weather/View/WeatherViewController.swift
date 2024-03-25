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
        static let cellIdentifier: String = "WeatherTableViewCell"
    }
    private let colorManager = ColorManager.shared
    
    private let output: WeatherViewOutput
    private let tableViewDataSource: WeatherTableViewDataSource
    
    private var scrollView: UIScrollView
    private var locationTextField: TextField
    private var locationButton: Button
    private var dateLabel: SecondaryLabel
    private var weatherImageView: UIImageView
    private var weatherDesriptionLabel: Label
    private var temperatureLabel: Label
    private var parametersTabControl: TabControl
    private var tableView: UITableView
    
    private var heightTableViewConstraint: NSLayoutConstraint?
    private var bottomTableViewConstraint: NSLayoutConstraint?

    // MARK: - Init

    init(output: WeatherViewOutput,
         tableViewDataSource: WeatherTableViewDataSource
    ) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        
        self.scrollView = UIScrollView().autolayout()
        self.locationTextField = TextField().autolayout()
        self.locationButton = Button().autolayout()
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parametersTabControl.contentOffset.x = -20
        tableView.contentOffset.y = -6
    }
    
    override func viewWillLayoutSubviews() {
        let distanceToBottom = UIScreen.main.bounds.size.height - tableView.frame.origin.y - tableView.frame.size.height

        if distanceToBottom <= 0 {
            bottomTableViewConstraint?.isActive = true
            heightTableViewConstraint?.isActive = false
        }
    }

    // MARK: - Private functions

    private func setUpUI() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 80),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(locationButton)
        NSLayoutConstraint.activate([
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            locationButton.heightAnchor.constraint(equalToConstant: 20),
            locationButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(locationTextField)
        NSLayoutConstraint.activate([
            locationTextField.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 8),
            locationTextField.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            locationTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            locationTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImageView.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 60),
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
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: parametersTabControl.bottomAnchor, constant: 30)
        ])
        
        heightTableViewConstraint = tableView.heightAnchor.constraint(equalToConstant: 365)
        heightTableViewConstraint?.isActive = true
        bottomTableViewConstraint = tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        bottomTableViewConstraint?.isActive = false
    }
    
    private func setUpAppearance() {
        view.backgroundColor = colorManager.colorForKey(.primaryBackground)
        
        weatherDesriptionLabel.fontSize = 23
        temperatureLabel.fontSize = 48
        parametersTabControl.contentInset.left = 20
        
        locationButton.delegate = self
        locationButton.buttonState = .search
        locationTextField.delegate = self
        
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
        tableView.isHidden = true

        output.setUpDate()
    }
    
    private func configureDesriptionLabel(text: String) {
        weatherDesriptionLabel.text = text
    }
    
    private func configureTemperatureLabel(text: String) {
        temperatureLabel.text = text
    }
    
    private func configureParametersTabControl(params: [String]) {
        parametersTabControl.labels = params
    }
    
    private func configureImageView(imageName: String) {
        weatherImageView.image = UIImage(named: imageName)
    }
    
    private func didUpdatedLocation() {
        changeLocationButton()
        output.updateLocation((locationTextField.text)?.trimmedAndNormalized)
    }
    
    private func changeLocationButton() {
        if locationButton.buttonState == .search {
            locationButton.buttonState = .location
        }
    }
}

extension WeatherViewController: WeatherViewInput {
    func configureLocationLabel(text: String) {
        locationTextField.text = text
    }
    
    func configureDateLabel(text: String) {
        dateLabel.text = text
    }
    
    func configureUI(description: String, temterature: String, params: [String], imageName: String) {
        configureDesriptionLabel(text: description)
        configureTemperatureLabel(text: temterature)
        configureParametersTabControl(params: params)
        configureImageView(imageName: imageName)
    }
    
    func configureTableView(forecasts: [Forecast]?) {
        tableView.isHidden = false
        tableViewDataSource.update(
            with: forecasts,
            tableView: tableView,
            delegate: self
        )
    }
    
    func didIncorrectLocation() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        
        UIView.animate(withDuration: 0.1, animations: {
            self.locationTextField.transform = CGAffineTransform(translationX: 10, y: 0)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                impactFeedbackgenerator.impactOccurred()
                self.locationTextField.transform = CGAffineTransform(translationX: -10, y: 0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.locationTextField.transform = CGAffineTransform.identity
                }, completion: { _ in
                    impactFeedbackgenerator.impactOccurred()
                })
            })
        })
    }
}

extension WeatherViewController: WeatherTableViewDataSourceDelegate {
    
}

extension WeatherViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        locationTextField.placeholder = locationTextField.text
        locationTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        didUpdatedLocation()
        
        return true
    }
}

extension WeatherViewController: ButtonDelegate {
    func searchButtonTapped() {
        locationTextField.becomeFirstResponder()
    }
    
    func locationButtonTapped() {
        locationButton.buttonState = .search
        output.updateCurrentLocation()
    }
}
