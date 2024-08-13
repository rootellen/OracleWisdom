//
//  ContentView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 06/08/24.
//

import SwiftUI
import Combine

struct DailyCardContentView: View {
    @ObservedObject var router = Router.shared
    
    var viewModel: DailyCardViewModelProtocol
    @State var dailyCard: DailyCard? = nil
    @State private var isSheetPresented = false
    
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
extension DailyCardContentView {
    @ViewBuilder var mainContent: some View {
        if let dailyCard {
            VStack(alignment: .center) {
                topHanger
                VStack {
                    image(dailyCard.shortName, dailyCard.isReversed)
                    
                }
                bottomHanger
                aboutThisCardButton
                interpretationButton
            }
        }
    }
    
    @ViewBuilder var topHanger: some View {
        Image("TopHanger", bundle: nil)
            .resizable()
            .frame(maxHeight: 120)
            .padding()
    }
    
    @ViewBuilder var aboutThisCardButton: some View {
        HStack {
            Button {
                isSheetPresented = true
            } label: {
                HStack {
                    Spacer()
                    Text("About this card")
                        .font(.playfairDisplay(size: 20))
                        .foregroundStyle(Color.darkMid)
                    Spacer()
                }
            }
            .buttonStyle(LargeRoundedButtonStyle(backgroundColor: Color.goldenLinearGradient, cornerRadius: 20))
            .padding()
            .sheet(isPresented: $isSheetPresented, onDismiss: {
                isSheetPresented = false
            }, content: {
                CardDetailsBuilder()
                    .setCard(card: dailyCard ?? nil)
                    .build()
                    .presentationDetents([.fraction(0.8)])
            })
            

        }
    }
    
    @ViewBuilder var interpretationButton: some View {
        HStack {
            Button {
            } label: {
                HStack {
                    Spacer()
                    Text("Get IA interpretation with Gemini")
                        .font(.playfairDisplay(size: 20))
                        .foregroundStyle(Color.darkMid)
                    Spacer()
                }
            }
            .buttonStyle(LargeRoundedButtonStyle(backgroundColor: Color.goldenLinearGradient, cornerRadius: 20))
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
        DailyCardContentView(viewModel: DailyCardViewPreviewViewModel())
    }
}

class DailyCardViewPreviewViewModel: DailyCardViewModelProtocol {
    func didTapAboutThisCardButton() {}
    
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> {
        Just(DailyCard(name: "", description: "", meaningReverse: "", meaningUp: "Loren ipsum blablabla seilaoquer", shortName: "ar00", number: 0, type: .major, suit: nil)).eraseToAnyPublisher()
    }
    
    func notifyAppearance() {}
}
