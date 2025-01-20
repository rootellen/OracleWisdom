//
//  GeminiViewModel.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import Foundation
import Combine
import SwiftUICore

protocol GeminiViewModelProtocol {
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var responsePublisher: AnyPublisher<String?, Never> { get }
    func notifyAppearance()
    func didTapGoBackButton()
}

class GeminiViewModel: @preconcurrency GeminiViewModelProtocol {
    @ObservedObject var router = Router.shared

    init(getGeminiResponseUseCase: GetGeminiResponseUseCaseProtocol = DIContainer.shared.inject(type: GetGeminiResponseUseCaseProtocol.self)!) {
        self.getGeminiResponseUseCase = getGeminiResponseUseCase
    }

    // Use cases
    var getGeminiResponseUseCase: GetGeminiResponseUseCaseProtocol
    var prompt: String?
    var cancellable: AnyCancellable?
    
    // Published
    @Published var responsePublished: String?
    @Published var isLoadingPublished = false

    // Publisher
    var responsePublisher: AnyPublisher<String?, Never> {
        $responsePublished.eraseToAnyPublisher()
    }
    
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $isLoadingPublished.eraseToAnyPublisher()
    }
    
    @MainActor
    func notifyAppearance() {
        isLoadingPublished = true
        Task {
            responsePublished = await getGeminiResponseUseCase.run()
            isLoadingPublished = false
        }
    }
    
    func didTapGoBackButton() {
        router.pop()
    }
}
