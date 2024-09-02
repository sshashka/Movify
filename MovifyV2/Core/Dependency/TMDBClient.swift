//
//  TMDBClient.swift
//  MovifyV2
//
//  Created by Саша Василенко on 29.08.2024.
//

import Foundation
import Dependencies


struct TMDBClient {
    var getMovies: @Sendable (Int) async throws -> TMDBNowPlayingModel?
}

extension TMDBClient: DependencyKey {
    static var liveValue: Self {
        let service = TMDBClientService()
        @Dependency (\.keychainService) var keychain
        return Self(
            getMovies: { page in
                let key = try await keychain.getTMDBKey()
                return await service.getNowPlayingMovies(key: key, page: page)
            }
        )
    }
}

private actor TMDBClientService {
    @Dependency (\.keychainService) var keychain
    
    func getNowPlayingMovies(key: String, page: Int, completion: @escaping(TMDBNowPlayingModel?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(key)&language=en-US&page=\(page)")
        guard let url else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                let result = try? JSONDecoder().decode(TMDBNowPlayingModel.self, from: data)
                completion(result)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
    
    func getNowPlayingMovies(key: String, page: Int) async -> TMDBNowPlayingModel? {
        await withCheckedContinuation { continuation in
            getNowPlayingMovies(key: key, page: page) { result in
                continuation.resume(returning: result)
            }
        }
    }
}


extension DependencyValues {
    var tmdbClient: TMDBClient {
        get { self[TMDBClient.self] }
        set { self[TMDBClient.self] = newValue }
    }
}
