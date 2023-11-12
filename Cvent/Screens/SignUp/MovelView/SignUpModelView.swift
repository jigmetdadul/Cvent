//
//  SignUpModelView.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 12/11/23.
//

import Foundation

class SignUpModelView{
    private let authService: AuthenticationService
    var signUpResult: ((_ result: Result)->Void)?
    
    init(authService: AuthenticationService) {
        self.authService = authService
    }
    
    func signUp(withEmail email:String, withPassword password: String){
        authService.createNewUser(email: email, password: password) { error in
            self.signUpResult?(.loading)
            switch error{
            case .failure(let error):
                self.signUpResult?(.failure(error: error))
            case .success():
                self.signUpResult?(.success)
            }
        }
    }
     
}

extension SignUpModelView{
    enum Result {
        case loading
        case success
        case failure(error: Error)
    }
}
