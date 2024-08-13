//
//  CardDetailsContentView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 13/08/24.
//

import Combine
import SwiftUI

struct CardDetailsContentView: View {
    
    var viewModel: CardDetailsViewModelProtocol
    
    init(viewModel: CardDetailsViewModelProtocol = DIContainer.shared.inject(type: CardDetailsViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    @State var card: DailyCard?
    
    var body: some View {
        mainContent
            .onReceive(viewModel.cardPublisher, perform: { card in
                self.card = card
            })
    }
}

private extension CardDetailsContentView {
    @ViewBuilder var mainContent: some View {
        simpleDivisor
        Text("Card Details")
            .font(.playfairDisplay(size: 35).italic())
            .foregroundStyle(Color.golden)
        if let card {
            VStack(alignment: .leading, spacing: 16) {
                name(card.name)
                description(card.description)
                meaningUp(card.meaningUp)
                meaningReverse(card.meaningReverse)
            }
            .padding()
        }
        simpleDivisor
    }
    
    @ViewBuilder 
    func name(_ cardName: String) -> some View {
        VStack(alignment: .leading) {
            category(text: "Name")
            text(text: cardName)
        }
    }
    
    @ViewBuilder 
    func description(_ description: String) -> some View {
        VStack(alignment: .leading) {
            category(text: "Description")
            text(text: description)
        }
    }
    
    @ViewBuilder
    func meaningUp(_ meaningup: String) -> some View {
        VStack(alignment: .leading) {
            category(text: "Meaning Up")
            text(text: meaningup)
        }
    }
    
    @ViewBuilder
    func meaningReverse(_ meaningReverse: String) -> some View {
        VStack(alignment: .leading) {
            category(text: "Meaning Reverse")
            text(text: meaningReverse)
        }
    }
    
    @ViewBuilder var simpleDivisor: some View {
        Image("SimpleDivisor", bundle: nil)
            .resizable()
            .frame(height: 30)
            .padding()
    }
    
    @ViewBuilder
    func category(text: String) -> some View {
        Text("\(text): ")
            .font(.playfairDisplay(size: 22))
            .bold()
    }
    
    @ViewBuilder
    func text(text: String) -> some View {
        Text("\(text)")
            .font(.playfairDisplay(size: 22).italic())
            .padding([.leading, .trailing])
    }
}

#Preview {
    ScrollView {
        CardDetailsContentView(viewModel: CardDetailsPreviewViewModel())
    }
}

class CardDetailsPreviewViewModel: CardDetailsViewModelProtocol {
    func setupDependencies(_ dependencies: CardDetailsViewModelDependencies) {
        // nil
    }
        
    var cardPublisher: AnyPublisher<DailyCard?, Never> {
        Just(DailyCard.mock).eraseToAnyPublisher()
    }
    
    init() {}
}
