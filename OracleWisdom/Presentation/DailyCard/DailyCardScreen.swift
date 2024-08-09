//
//  DailyCardScreen.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import SwiftUI

struct DailyCardScreen<Top: View,
                       Content: View,
                       Overlay: View>: View {
    private let viewModel: DailyCardViewModelProtocol
    private let top: Top
    private let content: Content
    private let overlay: Overlay
    
    init(viewModel: DailyCardViewModelProtocol = DIContainer.shared.inject(type: DailyCardViewModelProtocol.self)!,
         top: Top,
         content: Content,
         overlay: Overlay) {
        self.viewModel = viewModel
        self.top = top
        self.content = content
        self.overlay = overlay
    }
    
    var body: some View {
        ZStack {
            background
            VStack {
                ScrollView {
                    top
                    content
                }
            }
            overlay
        }
        .onAppear {
            viewModel.notifyAppearance()
        }
        .toolbar(.hidden)
    }
}

extension DailyCardScreen {
    @ViewBuilder var background: some View {
        LinearGradientBackground(colors: [Color.darkTop,
                                          Color.darkMid,
                                          Color.lightMid,
                                          Color.lightBottom])
    }
    
}

#Preview {
    DailyCardScreen(top: DailyCardTopView(), content: DailyCardView(), overlay: EmptyView())
}
