//
//  FirebaseDatabaseClient.swift
//  MovifyV2
//
//  Created by Саша Василенко on 28.08.2024.
//

import Dependencies
import FirebaseDatabase

struct FirebaseDatabaseClient {
    var getAIKey: () async throws -> String
    var getTMDBKey: () async throws -> String
}

extension FirebaseDatabaseClient: DependencyKey {
    static var liveValue: Self {
        let database = FirebaseRealtimeDatabase()
        return Self(
            getAIKey: {
                return await database.getAIKey()
            },
            getTMDBKey: {
                return await database.getTMDBKey()
            }
        )
    }
}


extension DependencyValues {
    var firebaseDatabaseClient: FirebaseDatabaseClient {
        get { self[FirebaseDatabaseClient.self] }
        set { self[FirebaseDatabaseClient.self] = newValue }
    }
}


private actor FirebaseRealtimeDatabase {
    private enum Reference: String {
        case aiKey = "AIKey"
        case tmdbKey = "TMDBKey"
    }
    
    private var database: Database
    
    init() {
        self.database = Database.database()
    }
    //TODO: - Write a func that accepts enum and gives complete database ref
    private func getReference(_ reference: Reference) -> DatabaseReference {
        return database.reference().child(reference.rawValue)
    }
    
    //TODO: - Add error handling
    func getAIKey() async -> String {
        do {
            let snapshot = try await getReference(.aiKey).getData()
            let value = snapshot.value as? String
            return value ?? String()
        } catch {
            print(error)
            return String()
        }
    }
    
    func getTMDBKey() async -> String {
        do {
            let snapshot = try await getReference(.tmdbKey).getData()
            let value = snapshot.value as? String
            return value ?? String()
        } catch {
            print(error)
            return String()
        }
    }
}
