//
//  SettingsViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 04/11/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var signOutButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func SignOutTapped(_ sender: UIButton) {
        print("Logout Pressed")
        FirebaseAuthentication.shared.logOutUser{
            AuthRes in
            switch AuthRes{
            case .unSuccessful: print("Logout un success")
                
            case .successful:
               print("Logout Success")
                self.performSegue(withIdentifier: "LogInId1", sender: self)
            }
        }
    }
    
}
