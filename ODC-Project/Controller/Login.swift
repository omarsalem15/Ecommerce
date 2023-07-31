//
//  Login.swift
//  ODC-Project
//
//  Created by Omar Salem on 31/07/2023.
//

import UIKit
import FirebaseAuth

class Login: UIViewController {
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let email = emailTxtField.text,
                  let password = passwordTxtField.text else {
                return
            }

            Auth.auth().signIn(withEmail: email, password: password) { [weak self] firebaseResult, error in
                guard let strongSelf = self else { return }

                if let e = error {
                    // Handle login error
                    strongSelf.showAlert(withMessage: "Error during login: \(e.localizedDescription)")
                } else {
                    // Login successful, proceed to home screen or show success message
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
    
    @IBAction func continueWithGoogleBtn(_ sender: Any) {
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
