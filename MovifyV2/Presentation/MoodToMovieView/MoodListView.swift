//
//  MoodListView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.07.2024.
//

import SwiftUI

struct MoodListView: View {
    var selectedMood: Mood?
    private let column: [GridItem] = [.init(.fixed(Double.oneHundredThirty)), .init(.fixed(Double.oneHundredThirty))]
    var body: some View {
        LazyVGrid(columns: column) {
            ForEach(Mood.allCases, id: \.self) { mood in
                Text(mood.rawValue)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: Double.twentyFive)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.mainBlue)
                            .frame(width: Double.oneHundredThirty)
                    }
            }
        }
    }
}

#Preview {
    MoodListView()
}
