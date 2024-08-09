//
//  DailyCardViewModel.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import Foundation
import Combine

protocol DailyCardViewModelProtocol {
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> { get }
    func notifyAppearance()
    func didTapAboutThisCardButton()
}

class DailyCardViewModel: DailyCardViewModelProtocol, ObservableObject {
    
    var useCase: DailyCardUseCaseProtocol
    var cancellable: AnyCancellable?
    
    init(useCase: DailyCardUseCaseProtocol = DIContainer.shared.inject(type: DailyCardUseCaseProtocol.self)!) {
        self.useCase = useCase
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

    // MARK: - Private func
    private func runDailyCardUseCase() {
        cancellable = useCase.run().sink(receiveCompletion: { completion in
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
