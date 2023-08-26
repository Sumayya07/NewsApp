//
//  LoginViewController.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 25/08/23.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var txtFieldEmail: CustomTextField!
    @IBOutlet var txtFieldPassword: CustomTextField!
    @IBOutlet var btnDisplayPassword: UIButton!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        btnDisplayPassword.addTarget(self, action: #selector(togglepasswordvisiblity), for: .touchUpInside)
        
    }
    
    @objc func togglepasswordvisiblity() {
        txtFieldPassword.isSecureTextEntry.toggle()
        btnDisplayPassword.isSelected.toggle()
    }
    
    func signInWithGoogle() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            // Check for errors
            guard error == nil else {
                print("Google Sign-In Error: \(error!.localizedDescription)")
                return
            }
            
            // Ensure there's a valid sign-in result
            guard let signInResult = signInResult else {
                print("Failed to obtain Google Sign-In result")
                return
            }
            
            // Extract user details
            let user = signInResult.user
            let emailAddress = user.profile?.email ?? "No email address"
            let firstName = user.profile?.givenName ?? ""
            let lastName = user.profile?.familyName ?? ""
            let fullName = "\(firstName) \(lastName)"
            
            // Print user details
            print("Full Name: \(fullName)")
            print("Email Address: \(emailAddress)")
            
            // Navigate to HeadlinesViewController
            let headlinesVC = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
            self.navigationController?.pushViewController(headlinesVC, animated: true)
        }
    }

    
    
    @IBAction func btnSigninTapped(_ sender: Any) {
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
                   Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                       if let e = error {
                           print("Error signing in: \(e.localizedDescription)")
                           self.showLoginErrorAlert()
                         } else {
                             // Sign-in successful, navigate to the next screen
                             let headlinesVC = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
                             self.navigationController?.pushViewController(headlinesVC, animated: true)
                         }
                     }
                 }
             }

             func showLoginErrorAlert() {
                 let alert = UIAlertController(title: "Login Error", message: "Invalid email or password. Please try again.", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                 alert.addAction(okAction)
                 present(alert, animated: true, completion: nil)
             }
    
    @IBAction func btnAppleTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func btnGoogleTapped(_ sender: Any) {
        signInWithGoogle()
        
    }
    
    
    @IBAction func btnFacebookTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
