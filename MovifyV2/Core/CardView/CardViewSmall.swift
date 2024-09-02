//
//  CardViewSmall.swift
//  MovifyV2
//
//  Created by Саша Василенко on 02.09.2024.
//

import SwiftUI

struct CardViewSmall: View {
    var body: some View {
        VStack {
            Image(.alien)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                    .rect(
                        cornerRadii: .init(
                            topLeading: Double.twentyFive,
                            topTrailing: Double.twentyFive
                        )
                    )
                )
                .containerRelativeFrame(.vertical) {size, _ in
                    size * 0.9
                }
            
            Text("Alien")
                .font(.title2)
        }
    }
}

#Preview {
    CardViewSmall()
}
