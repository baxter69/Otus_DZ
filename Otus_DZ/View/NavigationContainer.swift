//
//  NavigationContainer.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

//struct NavigationContainer: View {
//    let city: City
//    @EnvironmentObject private var nav: NavigationViewModel
//    
//    var body: some View {
//        ZStack {
//            switch nav.stack.last {
//            case .list:
//                WeatherListView(city: city)
//                    .id(city.id)
//            case .details(let temp):
//                WeatherDetailsView(temp: temp)
//            case .deep(let temp):
//                DeepDetailsView(temp: temp)
//            case .none:
//                EmptyView()
//            }
//        }
//    }
//}

//struct NavigationContainer: View {
//    let city: City
//    @EnvironmentObject private var nav: NavigationViewModel
//
//    var body: some View {
//        ZStack {
//            switch nav.stack.last {
//            case .list:
//                let vm = nav.getListViewModel(for: city)
//                WeatherListView(viewModel: vm)
//
//            case .details(let title):
//                WeatherDetailsView(title: title)
//
//            case .deep(let title):
//                DeepDetailsView(title: title)
//
//            case .none:
//                EmptyView()
//            }
//        }
//    }
//}

/// предпоследняя
struct NavigationContainer: View {
    let city: City
    @EnvironmentObject private var nav: NavigationViewModel

    var body: some View {
        ZStack {
            switch nav.stack.last {
            case .list:
                WeatherListView(city: city)

            case .details(let title):
                WeatherDetailsView(title: title)

            case .deep(let title):
                DeepDetailsView(title: title)

            case .none:
                EmptyView()
            }
        }
    }
}
