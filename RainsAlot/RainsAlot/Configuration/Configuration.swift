//
//  Configuration.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import Foundation

enum Defaults {
    static let location = LocationM(latitude: 37.335114, longitude: -122.008928)
}

enum WeatherService {
    static let apiKey = "ad68f7b77f722b1585a302ecfd316cf3"
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    static let currentWeatherPath = "/data/2.5/weather"
    static let forecastWeatherPath = "/data/2.5/forecast"
    static let reverseGeocoding =  "/geo/1.0/reverse"
}

