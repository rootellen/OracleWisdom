//
//  DailyCardRepositoryContract.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

protocol OracleWisdomRepositoryProtocol {
    func getDailyCard() -> AnyPublisher<DailyCard, Error>
    func saveGeminiPrompt(_ prompt: String) async
    func getGeminiPrompt() async -> String?
    func getGeminiResponse() async -> String?
}
