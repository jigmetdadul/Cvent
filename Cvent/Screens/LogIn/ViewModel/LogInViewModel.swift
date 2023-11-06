//
//  LogInViewModel.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 06/11/23.
//

import Foundation


class LogInViewModel {
    private let authService: AuthenticationService
    
    var authenticationResult: ((_ result: Result) -> Void)?
    
    init(authService: AuthenticationService) {
        self.authService = authService
         
    }
    
    func login(withEmail email: String, withPassword password: String) {
        authService.signInUser(email: email, password: password) { result in
            
            self.authenticationResult?(.checking)
            switch result {
            case .success:
                self.authenticationResult?(.success)
            case .failure(let error):
                print(error.localizedDescription)
                self.authenticationResult?(.incorrectData)
            }
        }
    }
}

extension LogInViewModel {
    enum Result {
        case incorrectData
        case checking
        case success
        case failure
    }
}


