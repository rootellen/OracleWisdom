//
//  DailyCardUseCase.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

protocol DailyCardUseCaseProtocol {
    func run() -> AnyPublisher<DailyCard, Error>
}

final class DailyCardUseCase: DailyCardUseCaseProtocol {
    private let repository: DailyCardRepositoryProtocol
    
    init(repository: DailyCardRepositoryProtocol = DIContainer.shared.inject(type: DailyCardRepositoryProtocol.self)!) {
        self.repository = repository
    }
    
    func run() -> AnyPublisher<DailyCard, Error> {
        repository.getDailyCard()
    }
}
