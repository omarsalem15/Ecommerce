//
//  Register.swift
//  ODC-Project
//
//  Created by Omar Salem on 31/07/2023.
//

import UIKit
import FirebaseAuth
import Firebase

class Register: UIViewController {

    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var confirmPassTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpBtn(_ sender: Any) {
        guard let username = usernameTxtField.text,
                 let email = emailTxtField.text,
                 let password = passwordTxtField.text,
                 let confirmPassword = confirmPassTxtField.text else {
               return
           }
           
           // Check if the password and confirm password match
           if password != confirmPassword {
               // Handle password mismatch error
               showAlert(withMessage: "Password and confirm password do not match.")
               return
           }
           
           // Create a new user in Firebase Authentication
           Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
               guard let strongSelf = self else { return }
               
               if let e = error {
                   // Handle sign-up error
                   strongSelf.showAlert(withMessage: "Error during sign-up: \(e.localizedDescription)")
               } else {
                   // Sign-up successful, proceed to home screen
                   strongSelf.performSegue(withIdentifier: "goToNext", sender: strongSelf)
               }
           }
       }

       func showAlert(withMessage message: String) {
           let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
