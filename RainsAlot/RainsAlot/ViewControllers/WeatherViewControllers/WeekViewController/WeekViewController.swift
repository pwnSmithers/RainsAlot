//
//  WeekViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

final class WeekViewController: UIViewController {

    var viewModel: WeekViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Helper methods
    private func setupView() {
        view.backgroundColor = .red
    }

    private func setupViewModel(with viewmodel: WeekViewModel) {
        
    }

}
