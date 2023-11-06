//
//  FirebaseAuthentication.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 03/11/23.
//

import Foundation
import FirebaseAuth

enum AuthenticationStatus: Error{
    case successful
    case unSuccessful
}


class FirebaseAuthentication{
    
    static let shared = FirebaseAuthentication()
    private let firebaseAuth = Auth.auth()
    private init(){
         
    }
    func createNewUser(withEmail email: String, withPassword password: String, completion: @escaping(AuthenticationStatus?)->Void){
        firebaseAuth.createUser(withEmail: email, password: password) { [weak self] authRes, error in
            guard self != nil else { return }
            
            if let error{
                print(error.localizedDescription)
                completion(.unSuccessful)
            }else{
                completion(.successful)
            }
        }
    }
    
    func signInUser(withEmail email: String, withPassword password: String, completion: @escaping(AuthenticationStatus?)->Void){
        firebaseAuth.signIn(withEmail: email, password: password) { AuthRes, error in
            if let error{
                print(error.localizedDescription)
                completion(.unSuccessful)
            }else{
                completion(.successful)
            }
        }
    }
    
    func logOutUser(completion: @escaping (AuthenticationStatus)->Void){
        
        
        do {
            let userEmail = getUserInfo()?.email ?? "User"
          try firebaseAuth.signOut()
            completion(.successful)
            print("\(userEmail) signed out")
        } catch let signOutError as NSError {
            completion(.unSuccessful)
            print("Error signing out: %@", signOutError.localizedDescription)
        }
      
    }
    
    func getUserInfo()->User?{
      firebaseAuth.currentUser
    }
}

