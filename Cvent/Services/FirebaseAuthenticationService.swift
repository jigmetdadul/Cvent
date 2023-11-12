//
//  testFire.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 06/11/23.
//

import Foundation
import FirebaseAuth

protocol AuthenticationService{
    
    func createNewUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func signInUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func logOutUser(completion: @escaping (Result<Void, Error>) -> Void)
    func getUserInfo() -> User?
}


class FirebaseAuthenticationService: AuthenticationService {
    private let firebaseAuth = Auth.auth()
    
    func createNewUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        firebaseAuth.createUser(withEmail: email, password: password) { [weak self] authRes, error in
            guard self != nil else { return }
            
            if let error{
                print(error.localizedDescription)
                completion(.failure(error))
            }else{
                completion(.success(()))
            }
        }
    }
    
    func signInUser(email: String, password: String, completion:  @escaping(Result<Void, Error>) -> Void) {
        
        firebaseAuth.signIn(withEmail: email, password: password) { AuthRes, error in
            if let error{
                print(error.localizedDescription)
                completion(.failure(error))
            }else{
                completion(.success(()))
            }
        }
    }
    
    func logOutUser(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let userEmail = getUserInfo()?.email ?? "User"
            try firebaseAuth.signOut()
            completion(.success(()))
            print("\(userEmail) signed out")
        } catch let signOutError as NSError {
            completion(.failure(signOutError))
            print("Error signing out: %@", signOutError.localizedDescription)
        }
    }
    
    func getUserInfo() -> User? {
        return firebaseAuth.currentUser
    }
    
    
}
