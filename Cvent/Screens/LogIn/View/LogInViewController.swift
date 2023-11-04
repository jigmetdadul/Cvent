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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LogInButtonTapped(_ sender: UIButton) {
        logInUser(registeredEmail: email, password: password)
    }
    func logInUser(registeredEmail: String, password: String){
        FirebaseAuthentication.shared.signInUser(withEmail: registeredEmail, withPassword: password) { AuthStatus in
            
            switch AuthStatus{
            case .unsSuccessful:
                print("LogIn Unsucessful")
            case .successful:
                print("Login successful")
                self.performSegue(withIdentifier: "LogInId", sender: self)
            case .none:
                print("nil found while trying to log In")
            }
        }
    }
}
