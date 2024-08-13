//
//  CardDetailsScreen.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 13/08/24.
//

import SwiftUI

struct CardDetailsScreen<Top: View,
                         Content: View,
                         Overlay: View> : View {
    private let top: Top
    private let content: Content
    private let overlay: Overlay
    
    init(top: Top, content: Content, overlay: Overlay) {
        self.top = top
        self.content = content
        self.overlay = overlay
    }
    
    var body: some View {
        ZStack {
            background
            VStack {
                ScrollView {
                    content
                }
            }
        }
    }
}

private extension CardDetailsScreen {
    @ViewBuilder var background: some View {
        LinearGradientBackground(colors: [.darkTop, .golden, .lightBottom])
    }
}

#Preview {
    CardDetailsScreen(top: EmptyView(), content: CardDetailsContentView(viewModel: CardDetailsPreviewViewModel()), overlay: EmptyView())
}
