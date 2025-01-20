//
//  SaveGeminiPromt.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

class SaveGeminiPromtParameters {
    let prompt: String
    
    init(prompt: String) {
        self.prompt = prompt
    }
}

protocol SaveGeminiPromtUseCaseProtocol {
    func run(params: SaveGeminiPromtParameters) async
}

final class SaveGeminiPromtUseCase: SaveGeminiPromtUseCaseProtocol {
    private let repository: OracleWisdomRepositoryProtocol
    
    init(repository: OracleWisdomRepositoryProtocol = DIContainer.shared.inject(type: OracleWisdomRepositoryProtocol.self)!) {
        self.repository = repository
    }
    
    func run(params: SaveGeminiPromtParameters) async {
        await repository.saveGeminiPrompt(params.prompt)
    }
}
