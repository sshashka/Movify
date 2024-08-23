//
//  RegisterFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import ComposableArchitecture

@Reducer
struct RegisterFeature {
    @ObservableState
    struct State: Equatable {
        var email: String = ""
        var password: String = ""
        var passwordConfirmation = ""
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case registerTapped
        case backToLoginTapped
    }
    
    @Dependency (\.dismiss) var dismiss
    @Dependency (\.authClient) var auth
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .registerTapped:
                return .run { [email = state.email, password = state.password] send in
                    try await self.auth.registerWithEmailPassword(email, password)
                }
                
            case .backToLoginTapped:
                return .run { _ in
                    await self.dismiss()
                }
                
            case .binding:
                return .none
            }
        }
    }
    
}
