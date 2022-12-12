//
//  DayViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

final class DayViewController: UIViewController {

    var viewModel: DayViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }

    //MARK: - Outlets
    @IBOutlet var tempratureLabel: UILabel!

    @IBOutlet var conditionLabel: UILabel!

    @IBOutlet var minTemperatureLabel: UILabel!

    @IBOutlet var maxTemperatureLabel: UILabel!

    @IBOutlet weak var currentTemperatureLabel: UILabel!

    @IBOutlet var backgroundImage: UIImageView!

    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.startAnimating()
            activityIndicatorView.hidesWhenStopped = true
        }
    }

    @IBOutlet var weatherDataViews: [UIView]! {
        didSet {
            for view in weatherDataViews {
                view.isHidden = true
            }
        }
    }
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Helper Methods
    private func setupView() {
        self.view.backgroundColor = .green
    }

    private func setupViewModel(with viewModel: DayViewModel) {
        activityIndicatorView.stopAnimating()

        tempratureLabel.text = viewModel.currentTemperature
        conditionLabel.text = viewModel.currentWeatherCondition
        currentTemperatureLabel.text = viewModel.currentTemperature
        minTemperatureLabel.text = viewModel.minTemperature
        maxTemperatureLabel.text = viewModel.maxTemperature
        backgroundImage.image = viewModel.backgroundImage

        for view in weatherDataViews {
            view.isHidden = false
        }
    }
}
