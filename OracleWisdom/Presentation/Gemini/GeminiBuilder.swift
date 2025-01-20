//
//  GeminiBuilder.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import SwiftUI

class GeminiBuilder {
    func build() -> some View {
        return GeminiScreen(top: getTopView(),
                            content: getContentView(),
                            overlay: getOverlayView())
    }
    
    @ViewBuilder
    func getTopView() -> some View {
        GeminiTopView()
    }
    
    @ViewBuilder
    func getContentView() -> some View {
        GeminiContentView()
    }
    
    @ViewBuilder
    func getOverlayView() -> some View {
        GeminiOverlayView()
    }
}
