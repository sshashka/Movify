//
//  LoginFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import ComposableArchitecture

@Reducer
struct LoginFeature {
    @ObservableState
    struct State: Equatable {
        var login: String = ""
        var password: String = ""
        var path = StackState<Path.State>()
    }
    
    enum Action: BindableAction {
        case loginTapped
        case registerTapped
        case binding(BindingAction<State>)
        case path(StackAction<Path.State, Path.Action>)
    }
    
    @Dependency(\.authClient) var auth
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .loginTapped:
                return .run { [email = state.login, pass = state.password] send in
                    try await auth.loginWith(email, pass)
                }
                
            case .registerTapped:
                state.path.append(.register(RegisterFeature.State()))
                return .none
            case .binding:
                return .none
                
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

extension LoginFeature {
    @Reducer(state: .equatable)
    enum Path {
        case register(RegisterFeature)
    }
}
