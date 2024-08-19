//
//  MoodToMovieFeature.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.07.2024.
//

import ComposableArchitecture

@Reducer
struct MoodToMovieFeature {
    struct State {
        var selectedMood: Mood?
    }
    
    enum Action {
        case selectedMood(mood: Mood)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectedMood(mood):
                state.selectedMood = mood
                return .none
            }
        }
    }
}
