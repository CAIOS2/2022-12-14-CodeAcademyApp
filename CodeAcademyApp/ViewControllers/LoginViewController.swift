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
        guard let account = accountForUsername(usernameTextField.text ?? "") else {
            print("Account doesn't exist")
            return
        }
        
        correctAccountPassword(account: account, password: passwordTextField.text ?? "") { isPasswordCorrect in // #1st closure block
            if isPasswordCorrect {
                accountPasswordExpired(account: account) { isExpiredPassword in // #2nd closure block
                    if !isExpiredPassword {
                        userLoggedInSuccessfully(account: account)
                    } else {
                        print("Password expired")
                    }
                }
            } else {
                print("Wrong account password")
            }
        }
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

extension LoginViewController {
    typealias LoginBoolCompletion = (Bool) -> Void
    
    private func accountForUsername(_ username: String) -> Account? {
        LocalDatabase.verifiedAccounts.first { verifiedAccount in
            return verifiedAccount.username == username
        }
    }
    
    private func isPasswordCorrectForAccount(_ account: Account, password: String) -> Bool {
        account.password == password
    }
    
    private func correctAccountPassword(account: Account, password: String, completion: LoginBoolCompletion) {
        if account.password == password {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    private func accountPasswordExpired(account: Account, completion: LoginBoolCompletion) {
        if account.isPasswordExpired {
            completion(true)
        } else {
            completion(false)
        }
    }
}
