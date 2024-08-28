//
//  HomeViewFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 29.08.2024.
//

import ComposableArchitecture

@Reducer
struct HomeViewFeature {
    
    struct State: Equatable {
        
    }
    
    enum Action {
        case didLoad
    }
    
    @Dependency (\.tmdbClient) var client
    
    //TODO: Remove this dependency to somewhere else
    @Dependency (\.keychainService) var keychain
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .didLoad:
                return .run { _ in
                    try await keychain.setKeys()
                    try await client.getMovies(1)
                }
            }
        }
    }
}
