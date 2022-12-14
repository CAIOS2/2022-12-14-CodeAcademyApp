//
//  RegisterViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import UIKit

class RegisterViewController: CodeAcademyViewController {

    /*
     You do not need to bother about already existing implementation here.
     You do not need to understand it or do any modifications to it.
     These are part of Design topic that we are going to discuss further down the course.
     */

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        usernameTextField.delegate = self
        nameTextField.delegate = self
        surnameTextField.delegate = self
        passwordTextField.delegate = self
    }

    /*
     This function is triggered when user presses on Register button.
     Once again, you do not need to understand the code that is already here.
     */
    @IBAction func registerButtonPressed(_ sender: Any) {
        /*
         Call your function to check if account information is valid
         If it is valid and user can be registered, call userRegisteredSuccessfully(account:) function
        */
    }

    private func userRegisteredSuccessfully(account: Account) {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        if let accountViewController = storyboard.instantiateViewController(identifier: "AccountViewController") as? AccountViewController {
            accountViewController.account = account
            present(accountViewController, animated: true)
        }
    }

    // MARK: - Your implementation goes here

    /*
     You need to call some functions from AccountManager to check if provided account credentials are valid.

     TIP: you will need to access the data that user has entered to our text fields.
     To do that, you can call usernameTextField.text etc. to get String values from them
     */


    /*
     After you pass the first check and user can be registered, we need to verify his account.
     This is replica of real world's email verification, for example.
     In other words, we can say that user successfully registered when his account goes from unverified to verified.
     Once you do that, you can call userRegisteredSuccessfully(account:) function
     */
}
