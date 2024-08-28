//
//  KeychainService.swift
//  MovifyV2
//
//  Created by Саша Василенко on 28.08.2024.
//

import KeychainSwift
import Dependencies

fileprivate enum KeychainKey: String {
    case aiService = "AI service"
    case apiService = "API service"
}

struct KeychainService {
    var setKeys: () async throws -> Void
    var getTMDBKey: () async throws -> String
}


extension KeychainService: DependencyKey {
    static var liveValue: Self {
        let keychain = KeychainSwift()
        @Dependency (\.firebaseDatabaseClient) var database
        return Self(
            setKeys: {
                let aiKey = try await database.getAIKey()
                let apiKey = try await database.getTMDBKey()
                print(apiKey)
                keychain.set(apiKey, forKey: KeychainKey.apiService.rawValue)
                keychain.set(aiKey, forKey: KeychainKey.aiService.rawValue)
            },
            getTMDBKey: {
                let key = keychain.get(KeychainKey.apiService.rawValue)
                print(key)
                guard let key else { return String() }
                return key
            }
        )
    }
}


extension DependencyValues {
    var keychainService: KeychainService {
        get { self[KeychainService.self] }
        set { self[KeychainService.self] = newValue }
    }
}
