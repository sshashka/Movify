//
//  CardView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 23.08.2024.
//
import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.alien)
                .resizable()
                .scaledToFit()
                .clipShape(
                    .rect(
                        cornerRadii: .init(
                            topLeading: Double.twentyFive,
                            topTrailing: Double.twentyFive
                        )
                    )
                )
            
            Text("Alien: Romulus")
                .font(.title)
            Text("Headliner to movie")
                .font(.headline)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: Double.twentyFive))
        .padding()
    }
}


#Preview {
    CardView()
}
