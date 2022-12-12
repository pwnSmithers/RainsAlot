//
//  WeatherRequest.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 09/12/2022.
//

import Foundation
import CoreLocation

struct WeatherRequest {
    let scheme: String
    let host: String
    let path: String
    let location: LocationM

    private var latitude: Double {
        return location.latitude
    }
    private var longitude: Double {
        return location.longitude
    }

    let appId: String

    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "appid", value: appId),
            URLQueryItem(name: "units", value: "metric")
        ]

        return components.url!
    }
}

struct LocationM {
    let latitude: Double
    let longitude: Double
}
