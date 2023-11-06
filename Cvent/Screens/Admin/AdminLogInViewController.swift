//
//  AdminLogInViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 03/11/23.
//

import UIKit
import FirebaseAuth

class AdminLogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var email: String { emailTextField.text! }
    private var password: String{ passwordTextField.text! }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func LogInButtonTapped(_ sender: UIButton) {
        print("pressed")
        FirebaseAuthentication.shared.signInUser(withEmail: email, withPassword: password) { authStatus in
            switch authStatus{
            case .unSuccessful:
                print("Unsucessul")
            case .successful:
                print("Successul")
                self.performSegue(withIdentifier: "AdminId", sender: self)
            case .none:
                print("Occurred nil while trying to log into admin")
            }
        }
    }
}
