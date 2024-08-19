//
//  MoodToMovieView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.07.2024.
//

import SwiftUI
import ComposableArchitecture

struct MoodToMovieView: View {
    let store: StoreOf<MoodToMovieFeature>
    var body: some View {
        VStack {
            Text("Hello, World!")
            MoodListView()
        }
    }
}

#Preview {
    MoodToMovieView(store: Store(initialState: MoodToMovieFeature.State(), reducer: {
        MoodToMovieFeature()
    }))
}
