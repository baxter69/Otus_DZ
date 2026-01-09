//
//  WeatherService.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation

final class WeatherService: WeatherServiceProtocol {
    func fetchWeather(for city: City) async throws -> WeatherResponse {
        let urlString =
        "https://api.open-meteo.com/v1/forecast?latitude=\(city.latitude)&longitude=\(city.longitude)&hourly=temperature_2m"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
