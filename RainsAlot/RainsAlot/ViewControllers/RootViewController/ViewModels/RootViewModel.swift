//
//  RootViewModel.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import Foundation

class RootViewModel {

    enum WeatherDataError: Error {
        case notAuthorizedToRequestLocation
        case failedToRequestLocation
        case noWeatherDataAvailable
    }

    enum CurrentWeatherDataResult {
        case success(CurrentWeatherData)
        case failure(WeatherDataError)
    }

    enum ForecastWeatherDataResult {
        case success(ForecastWeatherData)
        case failure(WeatherDataError)
    }

    enum CurrentLocationDataResult {
        case success(LocationM)
        case failure(WeatherDataError)
    }

    //MARK: - Type aliases
    typealias FetchCurrentWeatherCompletion = (CurrentWeatherDataResult) -> Void
    typealias FetchForecastWeatherCompletion = (ForecastWeatherDataResult) -> Void

    //MARK: - Properties
    var didFetchCurrentWeatherData: FetchCurrentWeatherCompletion?
    var didFetchForecastWeatherData: FetchForecastWeatherCompletion?
    private var locationService: LocationService?

    //MARK: - Initialization
    init() {
        fetchLocation()
    }
    //MARK: - Helper methods
    private func fetchWeatherData(for location: LocationM) {
        let weatherRequest = WeatherRequest(scheme: WeatherService.scheme, host: WeatherService.host, path: WeatherService.currentWeatherPath, location: Defaults.location, appId: WeatherService.apiKey)
        URLSession.shared.dataTask(with: weatherRequest.url.absoluteURL) {[weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }

            DispatchQueue.main.async {
                if let _ = error {
                    let result: CurrentWeatherDataResult = .failure(.noWeatherDataAvailable)
                    self?.didFetchCurrentWeatherData?(result)
                } else if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let currentWeatherResponnse = try jsonDecoder.decode(CurrentWeather.self, from: data)
                        let result: CurrentWeatherDataResult = .success(currentWeatherResponnse)
                        self?.didFetchCurrentWeatherData?(result)
                    } catch {
                        let result: CurrentWeatherDataResult = .failure(.noWeatherDataAvailable)
                        self?.didFetchCurrentWeatherData?(result)
                    }
                } else {
                    let result: CurrentWeatherDataResult = .failure(.noWeatherDataAvailable)
                    self?.didFetchCurrentWeatherData?(result)
                }
            }

        }.resume()
    }

    private func fetchForecastWeatherData(for location: LocationM) {
        let weatherRequest = WeatherRequest(scheme: WeatherService.scheme, host: WeatherService.host, path: WeatherService.forecastWeatherPath, location: location, appId: WeatherService.apiKey)
        URLSession.shared.dataTask(with: weatherRequest.url) {[weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {

                print("Status Code: \(response.statusCode) with response \(response)")
            }
            DispatchQueue.main.async {
                if let error = error{
                    print("Unable to fetch Weather Data \(error)")
                    let result: ForecastWeatherDataResult = .failure(.noWeatherDataAvailable)
                    self?.didFetchForecastWeatherData?(result)
                } else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let forecastWeatherResponnse = try decoder.decode(ForecastWeather.self, from: data)
                        let result: ForecastWeatherDataResult = .success(forecastWeatherResponnse)
                        self?.didFetchForecastWeatherData?(result)
                    } catch {
                        print("Unable to decode JSON \(error)")
                        let result: ForecastWeatherDataResult = .failure(.noWeatherDataAvailable)
                        self?.didFetchForecastWeatherData?(result)
                    }
                } else {
                    let result: ForecastWeatherDataResult = .failure(.noWeatherDataAvailable)
                    self?.didFetchForecastWeatherData?(result)
                }
            }
        }.resume()
    }

    private func fetchLocation() {
        locationService = LocationManager()
        locationService?.fetchLocation {[weak self] (result) in
            switch result {
            case .success(let location):
                self?.fetchWeatherData(for: location)
                self?.fetchForecastWeatherData(for: location)
            case .failure(let error):
                print(error)
            }
        }
    }

}
