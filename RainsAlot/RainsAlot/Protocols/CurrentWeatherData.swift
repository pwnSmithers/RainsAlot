//
//  WeatherData.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 10/12/2022.
//

import Foundation

protocol CurrentWeatherData {
    var latitude: Double { get }
    var longitude: Double { get }
    
    var current: CurrentWeatherConditions { get }
}

protocol CurrentWeatherConditions {
    var temp: Double {get}
    var feelsLike: Double {get}
    var tempMin: Double {get}
    var tempMax: Double {get}
    var humidity: Int {get}
}

protocol CurrentWindConditions {
    var speed: Double {get}
}

protocol WeatherConditions {
    var main: String {get}
    var weatherDescription: String {get}
    var icon: String {get}
}
