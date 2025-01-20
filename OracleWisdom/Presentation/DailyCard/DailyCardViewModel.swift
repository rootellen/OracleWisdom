//
//  DailyCardViewModel.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine
import SwiftUICore

protocol DailyCardViewModelProtocol {
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> { get }
    func notifyAppearance()
    func didTapAboutThisCardButton()
    func didTapGetAIInterpretation()
}

class DailyCardViewModel: DailyCardViewModelProtocol {
    @ObservedObject var router = Router.shared

    var dailyCardUseCase: DailyCardUseCaseProtocol
    var saveGeminiPromptUseCase: SaveGeminiPromtUseCaseProtocol
    var cancellable: AnyCancellable?
    
    init(dailyCardUseCase: DailyCardUseCaseProtocol = DIContainer.shared.inject(type: DailyCardUseCaseProtocol.self)!,
         saveGeminiPromptUseCase: SaveGeminiPromtUseCaseProtocol = DIContainer.shared.inject(type: SaveGeminiPromtUseCaseProtocol.self)!) {
        self.dailyCardUseCase = dailyCardUseCase
        self.saveGeminiPromptUseCase = saveGeminiPromptUseCase
    }
    
    // Published
    @Published var dailyCardPublished: DailyCard?
    
    // Publishers
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> {
        $dailyCardPublished.eraseToAnyPublisher()
    }
    
    func notifyAppearance() {
        runDailyCardUseCase()
    }
    
    func didTapAboutThisCardButton() {
        print(dailyCardPublished as Any)
    }
    
    func didTapGetAIInterpretation() {
        if let dailyCardPublished {
            let prompt = "Interpretate the meaning of the tarot card \(dailyCardPublished.name) \(dailyCardPublished.isReversed ? "in reverse" : "") for my daily card reading and give me some advice"
            let params = SaveGeminiPromtParameters(prompt: prompt)
            Task {
                await saveGeminiPromptUseCase.run(params: params)
            }
            router.navigateTo(Routes.gemini)
        }
    }

    // MARK: - Private func
    private func runDailyCardUseCase() {
        cancellable = dailyCardUseCase.run()
            .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(_):
                print("Erro")
            case .finished: break
            }
        }, receiveValue: { value in
            DispatchQueue.main.async {
                self.dailyCardPublished = value
                self.dailyCardPublished?.isReversed = Bool.random()
            }
        })
    }
}
