//
//  DailyCardRemote.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import Foundation
import Combine

protocol DailyCardRemoteDataSourceProtocol {
    func getDailyCard() -> AnyPublisher<DailyCard, Error>
}

class DailyCardRemoteDataSource: DailyCardRemoteDataSourceProtocol {
    private let networkClient: NetworkClientProtocol
        
    init(networkClient: NetworkClientProtocol = DIContainer.shared.inject(type: NetworkClientProtocol.self)!) {
        self.networkClient = networkClient
    }
    
    func getDailyCard() -> AnyPublisher<DailyCard, Error> {
        let request = DailyCardRequest()
        return networkClient.performRequest(request: request, responseType: DailyCardDTO.self)
            .tryMap { try $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
