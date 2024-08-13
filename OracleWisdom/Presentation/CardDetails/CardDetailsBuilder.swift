//
//  CardDetailsBuilder.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 13/08/24.
//

import SwiftUI

class CardDetailsBuilder {
    
    var card: DailyCard? = nil
    let viewModel: CardDetailsViewModelProtocol
    
    init(viewModel: CardDetailsViewModelProtocol = DIContainer.shared.inject(type: CardDetailsViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    func build() -> some View {
        viewModel.setupDependencies(CardDetailsViewModelDependencies(card: card))
        return CardDetailsScreen(top: getTopView(),
                                 content: getContentView(),
                                 overlay: getOverlayView())
    }
    
    func setCard(card: DailyCard?) -> CardDetailsBuilder {
        self.card = card
        return self
    }
    
    @ViewBuilder
    func getTopView() -> some View {
        EmptyView()
    }
    
    @ViewBuilder
    func getContentView() -> some View {
        CardDetailsContentView()
    }
    
    @ViewBuilder
    func getOverlayView() -> some View {
        EmptyView()
    }
}
