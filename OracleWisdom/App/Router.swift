//
//  Router.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 08/08/24.
//

import SwiftUI

enum Routes {
    case home
    case dailyCard
    case cardDetails
}

final class Router: ObservableObject {
    static let shared = Router()

    @Published var path = NavigationPath()

    private init() {}

    func navigateTo<T: Hashable>(_ view: T) {
        path.append(view)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
