//
//  LogInViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 02/11/23.
//

import UIKit


class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var email: String { emailTextField.text!}
    private var password: String {passwordTextField.text!}
    
    let viewModel = LogInViewModel(authService: FirebaseAuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogInButtonTapped(_ sender: UIButton) {
        print("pressed")
        viewModel.login(withEmail: email, withPassword: password)
    }
    
    //Data binding 
    func observeEvent(){
        viewModel.authenticationResult = { result in
            // Handle the authentication result here.
            switch result {
            case .checking:
                print("checking")
                break
            case .success:
                // Authentication succeeded, navigate to the next screen or perform the required action.
                print("Success")
                self.performSegue(withIdentifier: "LogInId", sender: self)
                break
            case .incorrectData:
                print("incorrectDat")
                // Handle incorrect login data (e.g., show an error message).
                break
            case .failure:
                print("failure")
                // Handle authentication failure (e.g., show an error message).
                break
            }
        }
        
    }

}
