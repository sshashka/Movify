//
//  TextViewModifier.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background {
                RoundedRectangle(cornerRadius: Double.twentyFive)
                    .stroke(lineWidth: Double.three)
                    .foregroundStyle(Color.mainBlue)
            }
    }
}
