//
//  TabViewFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.07.2024.
//

import ComposableArchitecture

@Reducer
struct TabViewFeature {
    struct State {
        var moodToMovie: MoodToMovieFeature.State = .init()
        var auth: LoginFeature.State = .init()
    }
    
    enum Action {
        case moodToMovie(MoodToMovieFeature.Action)
        case auth(LoginFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.moodToMovie, action: \.moodToMovie) {
            MoodToMovieFeature()
        }
        Scope(state: \.auth, action: \.auth) {
            LoginFeature()
        }
    }
}
