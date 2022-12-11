//
//  UIImage.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//
import UIKit

extension UIImage {
    class func imageForIcon(with name: String) -> UIImage? {
        switch name {
        case "Clouds":
            return UIImage(named: "Cloudy")
        case "Rain",
            "Drizzle",
            "Thunderstorm":
            return UIImage(named: "Rainy")
        case "Clear":
            return UIImage(named: "Sunny")
        default:
            return UIImage(named: "Sunny")
        }
    }
}
