//
//  RegisterView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct RegisterView: View {
    @Bindable var store: StoreOf<RegisterFeature>
    
    var body: some View {
        VStack {
            TextField("Email", text: $store.email)
                .applyTextViewStyle()
            TextField("Password", text: $store.password)
                .applyTextViewStyle()
            
            Button(action: {
                store.send(.registerTapped)
            }, label: {
                Text("Register")
            })
            .buttonStyle(StandardButtonStyle())
            
            Button(action: {
                store.send(.backToLoginTapped)
            }, label: {
                Text("Back to login page")
            })
            .buttonStyle(StandardButtonStyle())
        }
    }
}

//#Preview {
//    RegisterView()
//}
