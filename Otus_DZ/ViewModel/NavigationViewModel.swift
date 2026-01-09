//
//  NavigationViewModel.swift
//  Otus_DZ
//
//  Created by Владимир Воротников on 06.01.2026.
//

import Foundation
import Combine
import SwiftUI

enum Screen {
    case list
    case details(String)
    case deep(String)
}

/// кастомный стек
@MainActor
final class NavigationViewModel: ObservableObject {
    @Published var stack: [Screen] = [.list]

    func push(_ screen: Screen) {
        stack.append(screen)
    }

    func pop() {
        guard stack.count > 1 else { return }
        stack.removeLast()
    }
}
