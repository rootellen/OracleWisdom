//
//  HomeBuilder.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 09/08/24.
//

import SwiftUI

class HomeBuilder {
    
    let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol = DIContainer.shared.inject(type: HomeViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    func build() -> some View {
        return HomeScreen(top: getTopView(),
                          content: getContentView(),
                          overlay: getOverlayView())
    }
    
    @ViewBuilder
    func getTopView() -> some View {
        EmptyView()
    }
    
    @ViewBuilder
    func getContentView() -> some View {
        HomeContentView()
    }
    
    @ViewBuilder
    func getOverlayView() -> some View {
        EmptyView()
    }
}
