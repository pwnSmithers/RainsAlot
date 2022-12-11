//
//  UIImage.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//
import UIKit

extension UIImage {
    class func imageForBackground(with name: String) -> UIImage? {
        switch name {
        case "Clouds":
            return UIImage(named: "Cloudy")
        case "Rain",
            "Drizzle",
            "Thunderstorm":
            return UIImage(named: "Rainy")
        default:
            return UIImage(named: "Sunny")
        }
    }

    class func iconForWeather(with name: String) -> UIImage? {
        switch name {
        case "Clouds":
            return UIImage(named: "cloudyIcon")
        case "Rain",
            "Drizzle",
            "Thunderstorm":
            return UIImage(named: "rainyIcon")
        default:
            return UIImage(named: "sunnyIcon")
        }
    }
}
