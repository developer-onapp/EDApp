//
//  SignUpViewController.swift
//  EducationalApp
//
//  Created by F_Sur on 19/05/2021.
//

import UIKit
import Firebase

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
    
    // TODO:- <##>
    func checkUserSignUpBefore() {
        
    }
    
    func registerUser() {
        let db = Firestore.firestore()
        let newStudent = Student(firstName: firstNameTextField.text!, lastName: lastNameTextField.text, idNumber: icOrPassportTextField.text, email: emailTextFiled.text, password: passwordTextField.text)
//        do {
//            try db.collection("cities").document("LA").setData(newStudent)
//        } catch let error {
//            print("Error writing city to Firestore: \(error)")
//        }
//        
//        do {
//        try db.collection(K.DB.StudentsCollection).document(emailTextFiled.text!).setdata
//        } catch let error {
//            print("writing to db", error)
//        }


    }
}
