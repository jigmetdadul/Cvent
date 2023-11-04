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
    case unsSuccessful
}


class FirebaseAuthentication{
    
    static let shared = FirebaseAuthentication()
    
    private init(){
         
    }
    func createNewUser(withEmail email: String, withPassword password: String, completion: @escaping(AuthenticationStatus?)->Void){
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authRes, error in
            guard self != nil else { return }
            
            if let error{
                print(error.localizedDescription)
                completion(.unsSuccessful)
            }else{
                completion(.successful)
            }
        }
    }
    func signInUser(withEmail email: String, withPassword password: String, completion: @escaping(AuthenticationStatus?)->Void){
        Auth.auth().signIn(withEmail: email, password: password) { AuthRes, error in
            if let error{
                print(error.localizedDescription)
                completion(.unsSuccessful)
            }else{
                completion(.successful)
            }
        }
    }
}
