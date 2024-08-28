//
//  SwippableView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 23.08.2024.
//

import SwiftUI
import CardStack

struct MockData: Identifiable {
    let id: UUID = .init()
    let name: String
    let subtitle: String
}

struct SwippablesView: View {
    @State var data: [MockData]
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color.mainBlue
                .ignoresSafeArea(.all)
            VStack {
                CardStack(
                    direction: LeftRight.direction,
                    data: data
                ) { card, direction in
                    print(direction, card)
                } content: { card, direction, bool in
                    CardView()
                }
            }
        }
    }
}

#Preview {
    SwippablesView(data: [.init(name: "Alien", subtitle: "Alien"), .init(name: "Alien", subtitle: "Alien"), .init(name: "Alien", subtitle: "Alien"), .init(name: "Alien", subtitle: "Alien")])
}



