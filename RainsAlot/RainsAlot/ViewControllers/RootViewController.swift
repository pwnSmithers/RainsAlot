//
//  RootViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

final class RootViewController: UIViewController {

    //MARK: - Properties

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

        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
    }
}



extension RootViewController {
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }
}
