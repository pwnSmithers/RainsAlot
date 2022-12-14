//
//  RootViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

final class RootViewController: UIViewController {

    enum AlertType {
        case notAuthorizedToRequestLocation
        case failedToRequestLocation
        case noWeatherDataAvailable
    }

    //MARK: - Properties
    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
            setupForecastViewModel(with: viewModel)
        }
    }

    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to Instantiate DayViewController")
        }
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return dayViewController
    }()

    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to Instantiate DayViewController")
        }
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return weekViewController
    }()

    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewController()
    }

    private func setupChildViewController() {
        addChild(dayViewController)
        addChild(weekViewController)

        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)

        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true

        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor, constant: 18).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
    }

    func setupViewModel(with viewModel: RootViewModel) {
        viewModel.didFetchCurrentWeatherData = {[weak self] (result) in
            switch result {
            case .success(let weatherData):
                let dayViewModel = DayViewModel(currentWeatherData: weatherData.current, currentWind: weatherData.currentWind, todaysWeather: weatherData.currentWeather, currentLoaction: weatherData.locationName)
                self?.dayViewController.viewModel = dayViewModel
            case .failure(let error):
            let alertType: AlertType
            switch error {
            case .notAuthorizedToRequestLocation:
                alertType = .notAuthorizedToRequestLocation
            case .noWeatherDataAvailable:
                alertType = .noWeatherDataAvailable
            case .failedToRequestLocation:
                alertType = .failedToRequestLocation
            }
            self?.presentAlert(of: alertType)
            }
        }
    }

    private func setupForecastViewModel(with viewModel: RootViewModel) {
        viewModel.didFetchForecastWeatherData = {[weak self] (result) in
            switch result {
            case .success(let weatherData):
                let weekViewModel = WeekViewModel(weatherData: weatherData.forecast)
                self?.weekViewController.viewModel = weekViewModel
            case .failure(_):
                self?.presentAlert(of: .noWeatherDataAvailable)
            }
        }
    }

    private func presentAlert(of alertType: AlertType) {
        let title: String
        let message: String

        switch alertType {
        case .noWeatherDataAvailable:
            title = "Unable to fetch weather data"
            message = "The application is unable to fetch weather data. Please make sure your device is connected over wifi or cellular"
        case .notAuthorizedToRequestLocation:
            title = "Unable to fetch wether data for your location"
            message = "Raintaculous is not authorized to access your current location. This means it's unable to show you your current location. You can grant Raintaculous access to current location in the settings application."
        case .failedToRequestLocation:
            title = "Unable to fetch weather data"
            message = "The application is unable to fetch your location. Please make sure your device is connected over wi-fi or cellular."
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }

}

extension RootViewController {
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 410
        }
    }
}
