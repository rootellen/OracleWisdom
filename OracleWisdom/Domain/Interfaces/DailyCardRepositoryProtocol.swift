//
//  DailyCardRepositoryContract.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

protocol DailyCardRepositoryProtocol {
    func getDailyCard() -> AnyPublisher<DailyCard, Error>
}
