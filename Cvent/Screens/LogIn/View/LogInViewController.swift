//
//  LogInViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 02/11/23.
//

import UIKit
import FirebaseAuth

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
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else {
                print(" weak self error(LogIn)")
                return
            }
            
            if let error {
                print(error.localizedDescription)
            }else{
                print("Log In segue performed")
                self?.performSegue(withIdentifier: "LogInId", sender: self)
            }
        }
    }
}
