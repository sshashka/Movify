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
        ZStack {
            Color.mainBlue
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                VStack(spacing: Double.twenty) {
                    Text("Register")
                        .font(.title)
                        .fontWeight(.black)
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
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: Double.twentyFive))
                Spacer()
                
                Button(action: {
                    store.send(.backToLoginTapped)
                }, label: {
                    Text("Back to login page")
                })
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView(store: Store(initialState: RegisterFeature.State(), reducer: {
        RegisterFeature()
    }))
}
