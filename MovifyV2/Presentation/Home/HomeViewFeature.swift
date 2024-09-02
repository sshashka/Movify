//
//  HomeViewFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 29.08.2024.
//

import ComposableArchitecture

@Reducer
struct HomeViewFeature {
    @ObservableState
    struct State: Equatable {
        var nowPlayinMovies: [TMDBNowPlayingModelResult] = []
    }
    
    enum Action {
        case didLoad
        case clientResponded(TMDBNowPlayingModel?)
    }
    
    @Dependency (\.tmdbClient) var client
    
    //TODO: Remove this dependency to somewhere else
    @Dependency (\.keychainService) var keychain
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .didLoad:
                return .run { send in
                    try await keychain.setKeys()
                    try await send(.clientResponded(client.getMovies(1)))
                }
                
            case let .clientResponded(result):
                guard let result else { return .none }
                print(result)
                state.nowPlayinMovies = result.results
                return .none
            }
        }
    }
}
