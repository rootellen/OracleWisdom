//
//  GetGeminiResponseUseCase.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

protocol GetGeminiResponseUseCaseProtocol {
    func run() async -> String?
}

final class GetGeminiResponseUseCase: GetGeminiResponseUseCaseProtocol {
    private let repository: OracleWisdomRepositoryProtocol
    
    init(repository: OracleWisdomRepositoryProtocol = DIContainer.shared.inject(type: OracleWisdomRepositoryProtocol.self)!) {
        self.repository = repository
    }

    func run() async -> String? {
        return await repository.getGeminiResponse()
    }
}
