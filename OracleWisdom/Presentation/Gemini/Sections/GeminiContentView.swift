//
//  GeminiContentView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import SwiftUI
import Combine

struct GeminiContentView: View {    
    var viewModel: GeminiViewModelProtocol
    @State var interpretation: String = ""
    
    init(viewModel: GeminiViewModelProtocol = DIContainer.shared.inject(type: GeminiViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        mainContent
            .onReceive(viewModel.responsePublisher, perform: { text in
                if let text {
                    interpretation = text
                }
            })
    }
}

extension GeminiContentView {
    @ViewBuilder var mainContent: some View {
        if !interpretation.isEmpty {
            VStack {
                Text("Here's your AI generated interpretation:")
                    .font(.playfairDisplay(size: 28))
                    .foregroundStyle(Color.golden)
                    .padding(.bottom)
                Text(interpretation)
                    .font(.playfairDisplay(size: 24))
                    .foregroundStyle(.white)
            }.padding(.horizontal)
        }
    }
}

#Preview {
    ZStack {
        LinearGradientBackground(colors: [Color.darkTop,
                                          Color.darkMid,
                                          Color.lightMid,
                                          Color.lightBottom])
        .blendMode(.normal)
        GeminiContentView(viewModel: GeminiContentPreviewViewModel())
        
    }
}

class GeminiContentPreviewViewModel: GeminiViewModelProtocol {
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        Just(true).eraseToAnyPublisher()
    }
    
    func didTapGoBackButton() {}
    
    func notifyAppearance() {}
    
    var responsePublisher: AnyPublisher<String?, Never> {
        Just("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum").eraseToAnyPublisher()
    }
}
