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
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /*
     This function is triggered when user presses on Login button.
     Once again, you do not need to understand the code that is already here.
     */
    @IBAction func loginButtonTapped(_ sender: Any) {
        /*
         Call your function to check if login credentials are valid
         If they are valid and user can be logged in, call userLoggedInSuccessfully(account:) function
         */
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            showWarning(text: "Please enter your username")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showWarning(text: "Please enter your password")
            return
        }
        AccountManager.loginAccount(username: username, password: password) { isDone, account in
            guard isDone else {
                self.showWarning(text: "Ok")
                return
            }
            guard let account = account else {
                self.showWarning(text: "Not OK")
                return
            }
            self.userLoggedInSuccessfully(account: account)
        }
        
    }
    private func showWarning(text: String) {
        let alertController = UIAlertController(title: "Message", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
        
    }
    
    private func userLoggedInSuccessfully(account: Account) {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        if let accountViewController = storyboard.instantiateViewController(identifier: "AccountViewController") as? AccountViewController {
            accountViewController.account = account
            present(accountViewController, animated: true)
        }
    }
    
    
    // MARK: - Your implementation goes here
    
    /*
     You need to write some functions to check if provided login credentials are valid.
     Firstly, you need to check if an account with this username exists in our LocalDatabase.
     Secondly, you need to check if his password is correct and not expired (more on that in the Account class)
     
     TIP: you will need to access the data that user has entered to our text fields.
     To do that, you can call usernameTextField.text and passwordTextField.text to get String values from them
     */
    
    // func...
}
