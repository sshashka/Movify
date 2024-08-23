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
                
                VStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: Double.twenty) {
                        Text("Login")
                            .font(.title)
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity)
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
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot your password?")
                        })
                        
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(Double.twentyFive)
                    
                    Spacer()
                    
                    Button {
                        store.send(.registerTapped)
                    } label: {
                        Text("Register")
                    }
                }
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
