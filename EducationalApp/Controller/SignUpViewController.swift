//
//  SignUpViewController.swift
//  EducationalApp
//
//  Created by F_Sur on 19/05/2021.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class SignUpViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var segmentUserType: UISegmentedControl!
    // Text Fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var icOrPassportTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    // Variables
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
        setUpElements()
        
    }
    
    
    // Actions
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        // check all fields are filled?
        let warningMessage = validateFields()
        
        
        if warningMessage == nil {
            
            // TODO:-
            //            checkUserSignUpBefore()
            registerUser()
        }
        
        
        
    }
    
}

// MARK:  Register
extension SignUpViewController {
    // TODO:- <##>
    func checkUserSignUpBefore() {
        
    }
    
    func registerUser() {
        
        // Provide info to object od Students
        let newStudent = StudentsCollection(firstName: firstNameTextField.text!, lastName: lastNameTextField.text, idNumber: icOrPassportTextField.text, email: emailTextFiled.text, password: passwordTextField.text, lastUpdate: Data())
        
        // Register in Firestore
        do {
            try db.collection(K.DB.StudentsCollection).document(emailTextFiled.text!).setData(from: newStudent)
            print("succestfult to firestore")
        } catch let error {
            print("writing to db", error)
        }
        // Register in Auth
        Auth.auth().createUser(withEmail: emailTextFiled.text!, password: passwordTextField.text!) { [weak self] authResult, err in
            guard err == nil, authResult != nil else {self!.showWarning(); return}
            guard let strongSelf = self else {return}
            
            // TODO:- later work send to new view controller
            
            print("user Sign up Successfully")
            
            print(strongSelf.emailTextFiled.text!)

            
            // TODO:- keep user sign in
        }
        
    }
    
}
// MARK:  Helper Functions
extension SignUpViewController {
    
    func setUpElements() {
        UIUtilities.styleFilledButton(registerBtn)
        
        
    }
    func validateFields() -> String? {
        
        if firstNameTextField.text == "", lastNameTextField.text == "", icOrPassportTextField.text == "", emailTextFiled.text == "", passwordTextField.text == "", confirmPasswordTextField.text == "" {
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





