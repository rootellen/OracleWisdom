//
//  DailyCardRemote.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import Foundation
import Combine
import GoogleGenerativeAI

protocol OracleWisdomRemoteDataSourceProtocol {
    func getDailyCard() -> AnyPublisher<DailyCard, Error>
    func getGeminiResponse(prompt: String?) async -> String?
}

class OracleWisdomRemoteDataSource: OracleWisdomRemoteDataSourceProtocol {
    private let networkClient: NetworkClientProtocol
    private let model = GenerativeModel(name: "gemini-pro", apiKey: ApiKey.default)
        
    init(networkClient: NetworkClientProtocol = DIContainer.shared.inject(type: NetworkClientProtocol.self)!) {
        self.networkClient = networkClient
    }
    
    func getDailyCard() -> AnyPublisher<DailyCard, Error> {
        let request = DailyCardRequest()
        return networkClient.performRequest(request: request, responseType: DailyCardDTO.self)
            .tryMap { try $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    func getGeminiResponse(prompt: String?) async -> String? {
        if let prompt {
            do {
                let result = try await model.generateContent(prompt)
                return result.text
            } catch {
                fatalError()
            }
        }
        return nil
    }
}
