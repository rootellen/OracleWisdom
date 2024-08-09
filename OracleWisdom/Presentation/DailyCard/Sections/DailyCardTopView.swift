//
//  DailyCardTopView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import SwiftUI
import Combine

struct DailyCardTopView: View {
    @ObservedObject var router = Router.shared
    var viewModel: DailyCardViewModelProtocol
    
    @State var dailyCardName: String = ""
    
    init(viewModel: DailyCardViewModelProtocol = DIContainer.shared.inject(type: DailyCardViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        header
            .onReceive(viewModel.dailyCardPublisher, perform: { card in
                dailyCardName = card?.name ?? ""
            })
    }
}

extension DailyCardTopView {
    @ViewBuilder var header: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            router.pop()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.golden)
                                .padding()
                        }
                        Spacer()
                    }
                    HStack {
                        Text(dailyCardName)
                            .font(.playfairDisplay(size: 30).italic())
                            .foregroundColor(Color.golden)
                    }
                }
            }
        }
    }
}


#Preview {
    DailyCardTopView(viewModel: DailyCardTopPreviewViewModel())
}

class DailyCardTopPreviewViewModel: DailyCardViewModelProtocol {
    func didTapAboutThisCardButton() {}
    
    var dailyCardPublisher: AnyPublisher<DailyCard?, Never> {
        Just(DailyCard(name: "O Louco", description: "", meaningReverse: "", meaningUp: "", shortName: "", number: 0, type: CardType.major, suit: nil)).eraseToAnyPublisher()
    }
    
    func notifyAppearance() {}
}
