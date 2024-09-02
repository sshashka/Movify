//
//  CardViewExpanded.swift
//  MovifyV2
//
//  Created by Саша Василенко on 02.09.2024.
//

import SwiftUI

struct CardViewExpanded: View {
    var body: some View {
        ZStack {
            Color.mainBlue
                .ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: Double.ten) {
                    Image(.alien)
                        .resizable()
                        .scaledToFill()
                        .clipShape(
                            .rect(
                                cornerRadii: .init(
                                    topLeading: Double.twentyFive,
                                    topTrailing: Double.twentyFive
                                )
                            )
                        )
                    
                    VStack(alignment: .leading) {
                        Text("Alien: Romulus")
                            .font(.title)
                        Text("Headliner to movie")
                            .font(.headline)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent est magna, pretium id libero vel, lacinia ullamcorper nulla. Maecenas eu velit posuere, dapibus est in, imperdiet lectus. Etiam felis velit, aliquam nec lacinia in, elementum eu urna. Maecenas gravida ipsum ut mi vestibulum, vel ultrices orci pharetra. Quisque convallis leo rutrum ante volutpat, vel facilisis velit aliquam. Duis sollicitudin, augue et facilisis mattis, velit quam sagittis nisi, non aliquet augue nisi at nunc. Aliquam semper ornare nisl, eu molestie purus egestas quis. Morbi vel elit vestibulum, bibendum sapien at, auctor neque. Quisque porttitor tempor efficitur. Quisque ac rhoncus tellus. Cras congue nisl eget eros aliquam, eget posuere neque vehicula. Fusce gravida at nisi vel laoreet. Vestibulum efficitur elit sed justo vulputate, accumsan ornare mi suscipit. Maecenas venenatis eget nulla viverra ultricies. Curabitur in tempus diam. Fusce magna magna, fermentum sit amet porta et, dignissim non tortor. Vivamus convallis mi in odio condimentum dapibus. Fusce nec nisl nec ex consectetur tempor eu efficitur elit. Quisque eget nibh commodo, accumsan purus ut, scelerisque purus. Maecenas est quam, ullamcorper vel venenatis sed, convallis id dui. Aenean non felis sollicitudin, tincidunt sem non, aliquam.")
                    }
                    .padding()
                }
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                    })
                    .padding()
                }
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: Double.twentyFive))
                .padding()
            }
            
            .scrollIndicators(.never)
        }
        
    }
}


#Preview {
    CardViewExpanded()
}
