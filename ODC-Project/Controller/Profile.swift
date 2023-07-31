//
//  Profile.swift
//  ODC-Project
//
//  Created by Omar Salem on 31/07/2023.
//

import UIKit
import Firebase

class Profile: UIViewController {
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndDisplayUserInfo()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAndDisplayUserInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndDisplayUserInfo()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func signOutBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
    func fetchAndDisplayUserInfo() {
        if let currentUser = Auth.auth().currentUser {
            //let name = currentUser.displayName
            let email = currentUser.email
            
            // Update the UI labels with the user's name and email
            //nameLbl.text = name
            emailLbl.text = email
        }
    }
}
