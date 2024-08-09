//
//  DailyCardRepository.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

final class DailyCardRepository: DailyCardRepositoryProtocol {
    
    var remoteDataSource: DailyCardRemoteDataSourceProtocol
    
    init(remoteDataSource: DailyCardRemoteDataSourceProtocol = DIContainer.shared.inject(type: DailyCardRemoteDataSourceProtocol.self)!) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getDailyCard() -> AnyPublisher<DailyCard, Error> {
        remoteDataSource.getDailyCard()
    }
}
