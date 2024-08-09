//
//  ButtonStyle.swift
//  OracleWisdom
//
//  Created by Ruth Ellen on 08/08/24.
//

import SwiftUI

struct AboutThisCardStyle: ButtonStyle {
    var backgroundColor: LinearGradient
    var cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
