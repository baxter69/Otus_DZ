//
//  WeatherListViewModel.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine

/// paging ТОЛЬКО ТУТ
@MainActor
final class WeatherListViewModel: ObservableObject {

    @Published private(set) var rows: [WeatherRowViewModel] = []
    @Published private(set) var isLoading = false

    private let service: WeatherServiceProtocol
    private let city: City

    private let pageSize = 10
    private var page = 0

    private var allTemperatures: [Double] = []
    private var allTimes: [String] = []

    init(city: City, service: WeatherServiceProtocol) {
        self.city = city
        self.service = service
    }

    func onAppear() async {
        await load(reset: true)
    }

    func loadNextPageIfNeeded(index: Int) async {
        guard index == rows.count - 1 else { return }
        await load()
    }

    private func load(reset: Bool = false) async {
        guard !isLoading else { return }
        isLoading = true

        do {
            if reset {
                page = 0
                rows = []

                let response = try await service.fetchWeather(for: city)
                allTemperatures = response.hourly.temperature_2m
                allTimes = response.hourly.time
            }

            let start = page * pageSize
            let end = min(start + pageSize, allTemperatures.count)

            guard start < end else {
                isLoading = false
                return
            }

            let newRows: [WeatherRowViewModel] =
                (start..<end).map { index in
                    let dateTime = formatDateTime(allTimes[index])
                    let temp = String(format: "%.1f", allTemperatures[index])

                    return WeatherRowViewModel(
                        title: "\(dateTime): \(temp) °C"
                    )
                }

            rows.append(contentsOf: newRows)
            page += 1
        } catch {
            print(error)
        }

        isLoading = false
    }
}

private extension WeatherListViewModel {
    func formatDateTime(_ value: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

        guard let date = inputFormatter.date(from: value) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "ru_RU")
        outputFormatter.dateFormat = "d MMM, HH:mm"

        return outputFormatter.string(from: date)
    }
}


