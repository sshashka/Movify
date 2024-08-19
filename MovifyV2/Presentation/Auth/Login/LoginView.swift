//
//  LoginView.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    @State var mockBinding: String = ""
    @Bindable var store: StoreOf<LoginFeature>
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ZStack {
                Color.mainBlue
                    .ignoresSafeArea(.all)

                VStack(alignment: .leading, spacing: Double.twenty) {
                    Text("Login")
                        .font(.title).fontWeight(.black)
                    TextField("Email", text: $store.login)
                        .keyboardType(.emailAddress)
                        .applyTextViewStyle()
                    TextField("Password", text: $store.password)
                        .applyTextViewStyle()
                    
                    Button(action: {
                        store.send(.loginTapped)
                    }, label: {
                        Text("Login")
                    })
                    .buttonStyle(StandardButtonStyle())
                    
                    HStack {
                        Spacer()
                        Button(action: {
//                            store.send(.registerTapped)
                        }, label: {
                            Text("Forgot your password?")
                        })
                    }
                    Spacer()
                    Button(action: {
                        store.send(.registerTapped)
                    }, label: {
                        Text("Don`t have an acoount? Register now!")
                    })
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(Double.twentyFive)
                .padding()
            }
        } destination: { store in
            switch store.case {
            case let .register(store):
                RegisterView(store: store)
            }
        }
    }
}

#Preview {
    LoginView(store: Store(initialState: LoginFeature.State(), reducer: {
        LoginFeature()
    }))
}
