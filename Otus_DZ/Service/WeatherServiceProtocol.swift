//
//  WeatherServiceProtocol.swift
//  Otus_DZ
//
//  Created by Воротников Владимир on 06.01.2026.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: City) async throws -> WeatherResponse
}
