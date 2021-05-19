//
//  SignInViewController.swift
//  EducationalApp
//
//  Created by F_Sur on 19/05/2021.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class SignInViewController: UIViewController {

    // Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    // Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
        setUpElements()
        
    }
    
    
    // Actions
    
    @IBAction func sigInBtnTapped(_ sender: UIButton) {
        // check all fields are filled?
        let warningMessage = validateFields()
        
        if warningMessage == nil {
            
            // TODO:-
//            isUseSignedIn()
            signInUser()
        }
      
    }
    
}

// MARK:  Sign In
extension SignInViewController {
    // TODO:- <##>
    func isUseSignedIn() {
        
    }
    
    func signInUser() {
        // Check & Sign In User
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard  error != nil else { print(error?.localizedDescription); return }
            guard let strongSelf = self else { print("not find self"); return}

            
            // TODO:- later work send to new view controller
            print("user Sign in Successfully")
            print(Auth.auth().currentUser?.email)
            
            
            // TODO:- keep user sign in
        }
        
    }
    
}
// MARK:  Helper Functions
extension SignInViewController {
    
    func setUpElements() {
        UIUtilities.styleFilledButton(signInBtn)
        
        
    }
    func validateFields() -> String? {
        
        if  emailTextField.text == "", passwordTextField.text == "" {
            warningLabel.isHidden = false
            return "Please fill all fields"
        }
        return nil
    }
    
    func showWarning() {
        warningLabel.isHidden = false
        warningLabel.text = "Coudn't register"
    }
}





