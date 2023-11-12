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
    
    let viewModel = SignUpModelView(authService: FirebaseAuthenticationService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        // Do any additional setup after loading the view.
    }
     
    @IBAction func logButtonTapped(_ sender: UIButton) {
        if passwordConfirmed {
            viewModel.signUp(withEmail: email, withPassword: password)
        }
    }
    
    //the below functino keeps checking 
    
    func observeEvent(){
        viewModel.signUpResult = { result in
            switch result{
            case .loading:
                print("Loading")
            case .success:
                print("success")
                self.performSegue(withIdentifier: "SignUpId", sender: self)
            case .failure(let error):
                print("error in signUp: \(error.localizedDescription)")
            }
        }
    }
}




