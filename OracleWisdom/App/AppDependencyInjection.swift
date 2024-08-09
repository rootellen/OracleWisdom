//
//  AppDependencyInjection.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation

extension DIContainer {
    func registration() {
        
        // Configs
        register(type: NetworkClientProtocol.self, component: NetworkClient())
        
        // Home
        register(type: HomeViewModelProtocol.self, component: HomeViewModel())

        // DailyCard
        register(type: DailyCardRemoteDataSourceProtocol.self, component: DailyCardRemoteDataSource())
        register(type: DailyCardRepositoryProtocol.self, component: DailyCardRepository())
        register(type: DailyCardUseCaseProtocol.self, component: DailyCardUseCase())
        register(type: DailyCardViewModelProtocol.self, component: DailyCardViewModel())
    }
}
