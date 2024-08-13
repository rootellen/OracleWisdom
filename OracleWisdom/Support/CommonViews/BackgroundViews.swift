//
//  BackgroundViews.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 08/08/24.
//

import SwiftUI

struct LinearGradientBackground: View {
    let colors: [Color]
    
    var body: some View {
        LinearGradient(colors: colors,
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
        .preferredColorScheme(.light)
    }
}
