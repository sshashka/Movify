//
//  FirebaseAuthService.swift
//  MovifyV2
//
//  Created by Саша Василенко on 15.08.2024.
//

import Foundation
import FirebaseAuth
import ComposableArchitecture

struct FirebaseAuthClient {
    var loginWith: (String, String) async throws -> Void
    var registerWithEmailPassword: (String, String) async throws -> Void
}

extension FirebaseAuthClient: DependencyKey {
    static let liveValue = Self(
        loginWith: { email, password in
            try await Auth.auth().signIn(withEmail: email, password: password) { result, error in
                print(result?.user.uid)
            }
        }, registerWithEmailPassword: { email, pass in
            try await Auth.auth().createUser(withEmail: email, password: pass)
        }
    )
}

extension DependencyValues {
    var authClient: FirebaseAuthClient {
        get { self[FirebaseAuthClient.self] }
        set { self[FirebaseAuthClient.self] = newValue }
    }
}
