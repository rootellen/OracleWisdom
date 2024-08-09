//
//  ContentView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import SwiftUI
import Combine

struct DailyCardView: View {
    @ObservedObject var router = Router.shared
    
    var viewModel: DailyCardViewModelProtocol
    @State var dailyCard: DailyCard? = nil
    
    init(viewModel: DailyCardViewModelProtocol = DIContainer.shared.inject(type: DailyCardViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        mainContent
            .ignoresSafeArea(edges: .bottom)
            .onReceive(viewModel.dailyCardPublisher, perform: { card in
                dailyCard = card
            })
    }
}
extension DailyCardView {
    @ViewBuilder var mainContent: some View {
        if let dailyCard {
            VStack(alignment: .center) {
                topHanger
                VStack {
                    image(dailyCard.shortName, dailyCard.isReversed)
                    
                }
                bottomHanger
                cardInfo(dailyCard)
                aboutThisCardButton
            }
        }
    }
    
    @ViewBuilder var topHanger: some View {
        Image("TopHanger", bundle: nil)
            .resizable()
            .frame(maxHeight: 120)
            .padding()
    }
    
    @ViewBuilder
    func cardInfo(_ card: DailyCard) -> some View {
        VStack(alignment: .center) {
            Text("MEANING")
                .font(.playfairDisplay(size: 24).italic())
                .foregroundStyle(Color.goldenLinearGratient)
            cardMeaning(
                card.isReversed ? card.meaningReverse : card.meaningUp
            )
        }
    }
    
    @ViewBuilder
    func cardMeaning(_ meaning: String) -> some View {
        ZStack{
            cardBackground
            VStack {
                let meaning = "\(meaning)"
                Text(meaning)
                    .font(.playfairDisplay(size: 16))
                    .foregroundStyle(Color.goldenLinearGratient)
                    .padding()
            }
            .padding()
        }
    }
    
    @ViewBuilder var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                RadialGradient(colors: [Color.golden, Color.lightMid], center: .center, startRadius: 700, endRadius: 1)
            )
            .padding()
    }
    
    @ViewBuilder var aboutThisCardButton: some View {
        HStack {
            Button {
                router.navigateTo(Routes.cardDetails)
            } label: {
                HStack {
                    Spacer()
                    Text("About this card")
                        .font(.playfairDisplay(size: 20))
                        .foregroundStyle(Color.darkMid)
                    Spacer()
                }
            }
            .buttonStyle(AboutThisCardStyle(backgroundColor: Color.goldenLinearGratient, cornerRadius: 20))
            .padding()
        }
        
        
    }
    
    @ViewBuilder
    func image(_ resource: String, _ isReversed: Bool) -> some View {
        Image(resource, bundle: nil)
            .resizable(resizingMode: .stretch)
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            .frame(width: 300, height: 500)
            .aspectRatio(contentMode: .fit)
            .rotationEffect(
                isReversed ? .degrees(180.0) : .degrees(0)
            )
        
    }
    
    @ViewBuilder var bottomHanger: some View {
        Image("TopHanger", bundle: nil)
            .resizable()
            .rotationEffect(.degrees(180.0))
            .frame(maxHeight: 120)
            .padding()
    }
    
}

#Preview {
    ScrollView {
        DailyCardView(viewModel: DailyCardViewPreviewViewModel())
    }
}

class DailyCardViewPreviewViewModel: DailyCardViewModelProtocol {
    func didTapAboutThisCardButton() {}
    
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> {
        Just(DailyCard(name: "", description: "", meaningReverse: "", meaningUp: "Loren ipsum blablabla seilaoquer", shortName: "ar00", number: 0, type: .major, suit: nil)).eraseToAnyPublisher()
    }
    
    func notifyAppearance() {}
}
