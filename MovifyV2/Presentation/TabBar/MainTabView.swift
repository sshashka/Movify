//
//  MainTabView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 10.07.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
    let store: StoreOf<TabViewFeature>
    @State var selectedIndex = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                MoodToMovieView(store: store.scope(state: \.moodToMovie, action: \.moodToMovie))
                    .tag(0)
                    
                
                LoginView(store: store.scope(state: \.auth, action: \.auth))
                    .tag(1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbarBackground(.hidden, for: .tabBar)
            .ignoresSafeArea()
            
            TabBarView(tabItems: ["Moods", "Auth"], selectedIndex: $selectedIndex)
                .padding(.horizontal)
        }
        
    }
}

#Preview {
    MainTabView(store: Store(initialState: TabViewFeature.State(), reducer: {
        TabViewFeature()
    }))
}
