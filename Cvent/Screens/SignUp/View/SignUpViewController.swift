//
//  SignUpViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 02/11/23.
//

import UIKit


class SignUpViewController: UIViewController {

    
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var confirmPasswordTextField:UITextField!
    
    //The below is a computed property with only getter
    private var email: String {emailTextField.text!}
    private var password: String {passwordTextField.text!}
    private var passwordConfirmed: Bool {
        guard let confirmPasswordText = confirmPasswordTextField.text, let passwordText = passwordTextField.text else {
            return false // Handle cases where text fields' text is nil
        }
        return confirmPasswordText == passwordText
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
      }
    @IBAction func logButtonTapped(_ sender: UIButton) {
        if passwordConfirmed {
            FirebaseAuthentication.shared.createNewUser(withEmail: email, withPassword: password) { authStatus in
                switch authStatus{
                case .unsSuccessful:
                    print("Admin not registered or wrong password")
                case .successful:
                    print("signUp successful")
                    self.performSegue(withIdentifier: "SignUpId", sender: self)
                case .none:
                    print("nil found in SignUp")
                }
            }
        }
        
    }
}




