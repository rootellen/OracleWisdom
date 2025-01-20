//
//  GeminiScreen.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import SwiftUI

struct GeminiScreen<Top: View,
                    Content: View,
                    Overlay: View>: View {
    private let viewModel: GeminiViewModelProtocol
    private let top: Top
    private let content: Content
    private let overlay: Overlay
    
    init(viewModel: GeminiViewModelProtocol = DIContainer.shared.inject(type: GeminiViewModelProtocol.self)!,
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
                top
                ScrollView {
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

extension GeminiScreen {
    @ViewBuilder var background: some View {
        LinearGradientBackground(colors: [Color.darkTop,
                                          Color.darkMid,
                                          Color.lightMid,
                                          Color.lightBottom])
        .blendMode(.normal)
    }
    
}
