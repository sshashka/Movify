//
//  StandardButtonStyle.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import SwiftUI

struct StandardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.mainBlue)
            .cornerRadius(Double.twentyFive)
//            .fontStyle(.buttonsText)
    }
}
