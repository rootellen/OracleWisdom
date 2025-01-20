//
//  DailyCardRepository.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

final class OracleWisdomRepository: OracleWisdomRepositoryProtocol {
    var remoteDataSource: OracleWisdomRemoteDataSourceProtocol
    var localDataSource: OracleWisdomLocalDataSourceProtocol
    
    init(remoteDataSource: OracleWisdomRemoteDataSourceProtocol = DIContainer.shared.inject(type: OracleWisdomRemoteDataSourceProtocol.self)!,
         localDataSource: OracleWisdomLocalDataSourceProtocol = DIContainer.shared.inject(type: OracleWisdomLocalDataSourceProtocol.self)!) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getDailyCard() -> AnyPublisher<DailyCard, Error> {
        remoteDataSource.getDailyCard()
    }
    
    func saveGeminiPrompt(_ prompt: String) async {
        await localDataSource.saveGeminiPrompt(prompt)
    }
    
    func getGeminiPrompt() async -> String? {
        await localDataSource.getGeminiPrompt()
    }
    
    func getGeminiResponse() async -> String? {
        let prompt = await getGeminiPrompt()
        return await remoteDataSource.getGeminiResponse(prompt: prompt) ?? nil
    }
}
