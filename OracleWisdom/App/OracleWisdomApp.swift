//
//  OracleWisdomApp.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import SwiftUI

@main
struct OracleWisdomApp: App {
    
    @ObservedObject var router = Router.shared
    
    init() {
        DIContainer.shared.registration()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                HomeBuilder().build().navigationDestination(for: Routes.self) { route in
                    switch(route) {
                    case .home:
                        HomeBuilder().build()
                    case .dailyCard:
                        DailyCardBuilder().build()
                        
                    }
                }
            }
        }
    }
}
