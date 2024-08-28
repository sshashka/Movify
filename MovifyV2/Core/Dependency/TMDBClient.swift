//
//  TMDBClient.swift
//  MovifyV2
//
//  Created by Саша Василенко on 29.08.2024.
//

import Foundation
import Dependencies


struct TMDBClient {
    var getMovies: @Sendable (Int) async throws -> Void
}

extension TMDBClient: DependencyKey {
    static var liveValue: Self {
        @Dependency (\.keychainService) var keychain
        return Self(
            getMovies: { page in
                let key = try await keychain.getTMDBKey()
                let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(key)&language=en-US&page=\(page)")
                guard let url else { return }
                var request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data {
                        print("TMDB data: \(data)")
                    } else {
                        print("error", error)
                    }
                }
                .resume()
            }
        )
    }
}


extension DependencyValues {
    var tmdbClient: TMDBClient {
        get { self[TMDBClient.self] }
        set { self[TMDBClient.self] = newValue }
    }
}
