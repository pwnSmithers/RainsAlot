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
        return "\(Int(currentWeatherData.temp)) °C"
    }

    var minTemperature: String {
        return "\(Int(currentWeatherData.tempMin)) °C"
    }

    var maxTemperature: String {
        return "\(Int(currentWeatherData.tempMax)) °C"
    }

    var currentWeatherCondition: String {
        return todaysWeather[0].main
    }

    var backgroundImage: UIImage? {
       return UIImage.imageForBackground(with: todaysWeather[0].main)
    }
}
