//
//  CurrentWeather.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}


extension CurrentWeather: CurrentWeatherData {
    var time: Int {
        return timezone
    }

    var locationName: String {
        return name
    }

    var currentWeather: [WeatherConditions] {
        return weather
    }

    var currentWind: CurrentWindConditions {
        return wind
    }

    var current: CurrentWeatherConditions {
        return main
    }

}

extension Main: CurrentWeatherConditions {

}

extension Wind: CurrentWindConditions {

}

extension Weather: WeatherConditions {


}
