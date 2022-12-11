//
//  WeekViewModel.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 10/12/2022.
//

import Foundation

struct WeekViewModel {
    let weatherData: [ForecastWeatherConditions]

    var numberOfDays: Int{
        return weatherData.count
    }

//    func viewModel(for index: Int) -> WeekDayViewModel {
//        return WeekDayViewModel(weatherData: weatherData[index])
//    }
}
