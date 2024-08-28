//
//  HomeVIew.swift
//  MovifyV2
//
//  Created by Саша Василенко on 29.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    var store: StoreOf<HomeViewFeature>
    var body: some View {
        Text("Ohio")
            .onAppear {
                store.send(.didLoad)
            }
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeViewFeature.State(), reducer: {
        HomeViewFeature()
    }))
}
