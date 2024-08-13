//
//  CardDetailsViewModel.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 13/08/24.
//

import Combine

class CardDetailsViewModelDependencies {
    let card: DailyCard?
    
    init(card: DailyCard?) {
        self.card = card
    }
}

protocol CardDetailsViewModelProtocol {
    func setupDependencies(_ dependencies: CardDetailsViewModelDependencies)
    var cardPublisher: AnyPublisher<DailyCard?, Never> { get }
}

class CardDetailsViewModel: CardDetailsViewModelProtocol {
    
    // Published
    @Published var card: DailyCard?
    
    // Publisher
    var cardPublisher: AnyPublisher<DailyCard?, Never> {
        $card.eraseToAnyPublisher()
    }
    
    func setupDependencies(_ dependencies: CardDetailsViewModelDependencies) {
        self.card = dependencies.card
    }
}
