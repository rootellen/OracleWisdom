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
        
        // Repository and data source
        register(type: OracleWisdomRemoteDataSourceProtocol.self, component: OracleWisdomRemoteDataSource())
        register(type: OracleWisdomLocalDataSourceProtocol.self, component: OracleWisdomLocalDataSource())
        register(type: OracleWisdomRepositoryProtocol.self, component: OracleWisdomRepository())
        
        // Use Cases
        register(type: DailyCardUseCaseProtocol.self, component: DailyCardUseCase())
        register(type: SaveGeminiPromtUseCaseProtocol.self, component: SaveGeminiPromtUseCase())
        register(type: GetGeminiResponseUseCaseProtocol.self, component: GetGeminiResponseUseCase())
        
        // Home
        register(type: HomeViewModelProtocol.self, component: HomeViewModel())
        
        // Daily Card
        register(type: DailyCardViewModelProtocol.self, component: DailyCardViewModel())
        
        // Card Details
        register(type: CardDetailsViewModelProtocol.self, component: CardDetailsViewModel())
        
        // Gemini
        register(type: GeminiViewModelProtocol.self, component: GeminiViewModel())
    }
}
