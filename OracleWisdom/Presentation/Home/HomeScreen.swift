//
//  HomeScreen.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 09/08/24.
//

import SwiftUI

struct HomeScreen<Top: View,
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
                top
                ScrollView {
                    content
                }
            }
        }
        .toolbar(.hidden)
    }
}

private extension HomeScreen {
    @ViewBuilder var background: some View {
        LinearGradientBackground(colors: [Color.darkTop,
                                          Color.darkMid,
                                          Color.lightMid,
                                          Color.lightBottom])
    }
}

#Preview {
    HomeScreen(top: EmptyView(), content: HomeContentView(), overlay: EmptyView())
}
