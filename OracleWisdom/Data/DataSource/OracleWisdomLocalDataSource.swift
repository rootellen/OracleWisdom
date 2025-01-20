//
//  OracleWisdomLocalDataSource.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

protocol OracleWisdomLocalDataSourceProtocol {
    func saveGeminiPrompt(_ prompt: String) async
    func getGeminiPrompt() async -> String?
}

actor OracleWisdomLocalDataSource: OracleWisdomLocalDataSourceProtocol {
    var geminiPrompt: String?
    
    func saveGeminiPrompt(_ prompt: String) async {
        self.geminiPrompt = prompt
    }
    
    func getGeminiPrompt() async -> String? {
        return geminiPrompt
    }
}
