//
//  DailyCardBuilder.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 07/08/24.
//

import SwiftUI

class DailyCardBuilder {
    func build() -> some View {
        return DailyCardScreen(top: getTopView(),
                               content: getContentView(),
                               overlay: getOverlayView())
    }
    
    @ViewBuilder
    func getTopView() -> some View {
        DailyCardTopView()
    }
    
    @ViewBuilder
    func getContentView() -> some View {
        DailyCardContentView()
    }
    
    @ViewBuilder
    func getOverlayView() -> some View {
        EmptyView()
    }
}
