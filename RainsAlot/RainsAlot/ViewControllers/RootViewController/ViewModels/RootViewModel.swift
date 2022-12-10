//
//  RootViewModel.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import Foundation

class RootViewModel {

    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }

    //MARK: - Type aliases
    typealias DidFetchWeatherDataCompletion = (Data?, Error) -> Void

    //MARK: - Properties
    var didFetchWeatherData: ((CurrentWeatherData?, WeatherDataError?) -> Void)?

    //MARK: - Initialization
    init() {
        fetchWeatherData()
    }
    //MARK: - Helper methods
    private func fetchWeatherData() {
        let weatherRequest = WeatherRequest(scheme: WeatherService.scheme, host: WeatherService.host, path: WeatherService.currentWeatherPath, location: Defaults.location, appId: WeatherService.apiKey)
        URLSession.shared.dataTask(with: weatherRequest.url.absoluteURL) {[weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }

            if let error = error {
                print("Unable to fetch weather data \(error)")
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            } else if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let currentWeather = try jsonDecoder.decode(CurrentWeather.self, from: data)
                    self?.didFetchWeatherData?(currentWeather, nil)
                } catch {
                    print("Unable to decode data with \(error)")
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            } else {
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            }

        }.resume()
    }

}
