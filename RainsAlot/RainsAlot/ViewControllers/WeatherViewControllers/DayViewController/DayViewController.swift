//
//  DayViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

final class DayViewController: UIViewController {

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Helper Methods
    private func setupView() {
        self.view.backgroundColor = .green
    }
}
