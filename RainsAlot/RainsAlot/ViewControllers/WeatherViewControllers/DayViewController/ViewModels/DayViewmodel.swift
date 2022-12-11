//
//  DayViewmodel.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 10/12/2022.
//

import UIKit

struct DayViewModel {

    let currentWeatherData: CurrentWeatherConditions
    let currentWind: CurrentWindConditions
    let todaysWeather: [WeatherConditions]
    let currentLoaction: String

    var currentTemperature: String {
        return String(format: "%.1f °F", currentWeatherData.temp)
    }

    var minTemperature: String {
        return String(format: "%.1f °F", currentWeatherData.tempMin)
    }

    var maxTemperature: String {
        return String(format: "%.1f °F", currentWeatherData.tempMax)
    }

    var currentWeatherCondition: String {
        return todaysWeather[0].main
    }

    var backgroundImage: UIImage? {
       return UIImage.imageForIcon(with: todaysWeather[0].main)
    }
}
