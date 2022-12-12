//
//  ForecastWeatherData.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 10/12/2022.
//

import Foundation

protocol ForecastWeatherData {
    var forecast: [ForecastWeatherConditions] {get}
}

protocol ForecastWeatherConditions {
    var main: MainClass {get}
    var weather: [Weather] {get}
    var wind: Wind {get}
    var dtTxt: String {get}
}
