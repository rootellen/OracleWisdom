//
//  HomePresentation.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 08/08/24.
//

import SwiftUI

struct HomeContentView: View {
    
    @ObservedObject var router = Router.shared
    let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol = DIContainer.shared.inject(type: HomeViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        mainContent
            .ignoresSafeArea(edges: .bottom)
    }
}

extension HomeContentView {
    @ViewBuilder var mainContent: some View {
        dailyCard
    }
    
    @ViewBuilder var dailyCard: some View {
        VStack(alignment: .leading) {
            Text("What's your mind saying?")
                .font(.playfairDisplay(size: 45).italic())
                .foregroundStyle(Color.golden)
                .padding(.top, 50)
                .padding([.bottom, .leading])
            card
                .frame(height: 310)
                .onTapGesture {
                    router.navigateTo(Routes.dailyCard)
                }
        }
    }
    
    @ViewBuilder var card: some View {
        ZStack {
            cardBackground
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Spacer()
                    Image("OracleHand", bundle: nil)
                    Spacer()
                 }
                Text("Card of the day")
                    .font(.playfairDisplay(size: 34))
                    .foregroundStyle(.white)
                HStack {
                    Text("Discover")
                        .font(.playfairDisplay(size: 22))
                        .foregroundStyle(.white)
                    Spacer()
                    Image("Arrow", bundle: nil)
                        .rotationEffect(.degrees(180.0))
                }
            }
            .padding()
        }
        .padding()
    }
    
    @ViewBuilder var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                RadialGradient(colors: [Color.golden,
                                        Color.darkTop],
                               center: .center,
                               startRadius: 700,
                               endRadius: 1)
            )
    }
}

#Preview {
    HomeContentView()
}
