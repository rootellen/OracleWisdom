//
//  GeminiTopView.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 20/01/25.
//

import SwiftUI
import Combine

struct GeminiTopView: View {
    let viewModel: GeminiViewModelProtocol
    
    init(viewModel: GeminiViewModelProtocol = DIContainer.shared.inject(type: GeminiViewModelProtocol.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        header
    }
}

extension GeminiTopView {
    @ViewBuilder var header: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            viewModel.didTapGoBackButton()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.golden)
                                .padding()
                        }
                        Spacer()
                    }
                    HStack {
                        Text("Gemini Interpretation")
                            .font(.playfairDisplay(size: 30).italic())
                            .foregroundColor(Color.golden)
                    }
                }
            }
        }
    }
}
