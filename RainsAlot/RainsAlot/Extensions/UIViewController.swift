//
//  UIViewController.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import UIKit

extension UIViewController {
    //MARK: - Static properties
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
