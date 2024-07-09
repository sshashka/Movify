//
//  MainTabView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 10.07.2024.
//

import SwiftUI

struct MainTabView: View {
    //    let store: StoreOf<TabBarFeature>
    @State var selectedIndex = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                TestToWorkView()
                    .tag(0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbarBackground(.hidden, for: .tabBar)
                
//                AboutDev()
//                    .tag(1)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .toolbarBackground(.hidden, for: .tabBar)
//                    .modelContainer(for: [PointDataToSave.self])
            }
            
            .ignoresSafeArea()
            
            TabBarView(tabItems: ["Карта", "Про розробника"], selectedIndex: $selectedIndex)
                .padding(.horizontal)
        }
        
    }
}

#Preview {
    MainTabView()
}
