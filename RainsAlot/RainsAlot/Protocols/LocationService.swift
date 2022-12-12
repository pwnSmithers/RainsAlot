//
//  LocationService.swift
//  RainsAlot
//
//  Created by Mugalu Smith Yusuf on 12/12/2022.
//

import Foundation

enum LocationServiceError {
    case notAuthorizedToRequestLocation
}

enum LocationServiceResult {
    case success(LocationM)
    case failure(LocationServiceError)
}
protocol LocationService {
    typealias FetchLocationCompletion = (LocationServiceResult) -> Void
    func fetchLocation(completion: @escaping FetchLocationCompletion)
}
