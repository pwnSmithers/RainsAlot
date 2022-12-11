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

    @IBOutlet var weekTableView: UITableView! {
        didSet {
            weekTableView.isHidden = false
            weekTableView.dataSource = self
            weekTableView.separatorInset = .zero
            weekTableView.estimatedRowHeight = 44.0
            weekTableView.rowHeight = UITableView.automaticDimension
            weekTableView.showsVerticalScrollIndicator = false
        }
    }

    @IBOutlet var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
        }
    }

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Helper methods
    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupViewModel(with viewmodel: WeekViewModel) {
        activityIndicator.stopAnimating()

        weekTableView.reloadData()
        weekTableView.isHidden = false
    }

}

extension WeekViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfDays ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekDayTableViewCell.reuseIdentifier, for: indexPath) as? WeekDayTableViewCell else {
            fatalError("Unable to dequeue week day tale view cell")
        }
        guard let viewModel = viewModel else {
            fatalError("no view model is present")
        }
        cell.confirgure(with: viewModel.viewModel(for: indexPath.row))
        return cell
    }
}
