//
//  LoginViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import UIKit

class LoginViewController: CodeAcademyViewController {

    /*
     You do not need to bother about already existing implementation here.
     You do not need to understand it or do any modifications to it.
     These are part of Design topic that we are going to discuss further down the course.
     */

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    /*
     This function is triggered when user presses on Login button.
     Once again, you do not need to understand the code that is already here.
     */
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        
        
        guard let username = usernameTextField.text,
            let password = passwordTextField.text
            else {
            return
        }
        
        guard let account = AccountManager.verifyAccount(username: username, password: password) else {
            print("No accout found ")
            return
        }
        print("Account \(String(describing: account))")
        userLoggedInSuccessfully(account: account)
        
        /*
         Call your function to check if login credentials are valid
         If they are valid and user can be logged in, call userLoggedInSuccessfully(account:) function
        */
    }

    private func userLoggedInSuccessfully(account: Account) {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        if let accountViewController = storyboard.instantiateViewController(identifier: "AccountViewController") as? AccountViewController {
            accountViewController.account = account
            present(accountViewController, animated: true)
        }
    }

}
