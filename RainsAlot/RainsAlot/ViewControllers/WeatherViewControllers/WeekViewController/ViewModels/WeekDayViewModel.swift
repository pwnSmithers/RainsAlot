//
//  WeekDayViewModel.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 11/12/2022.
//

import UIKit
struct WeekDayViewModel {

    let weatherData: ForecastWeatherConditions
    let dateFormatter = DateFormatter()

    var tempreture: String {
        return "\(Int(weatherData.main.temp)) °C"
    }

    var image: UIImage? {
        print("\(weatherData.weather[0].main)")
        return UIImage.iconForWeather(with: "\(weatherData.weather[0].main)")?.withTintColor(.black)
    }


    var day: String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: weatherData.dtTxt)

        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date ?? Date())
        return weekday
    }
}

extension WeekDayViewModel: WeekDayRepresentable {

}
