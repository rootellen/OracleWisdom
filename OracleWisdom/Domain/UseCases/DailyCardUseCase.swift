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
    private let repository: OracleWisdomRepositoryProtocol
    
    init(repository: OracleWisdomRepositoryProtocol = DIContainer.shared.inject(type: OracleWisdomRepositoryProtocol.self)!) {
        self.repository = repository
    }
    
    func run() -> AnyPublisher<DailyCard, Error> {
        repository.getDailyCard()
    }
}
