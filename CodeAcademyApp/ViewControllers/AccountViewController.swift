//
//  AccountViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-13.
//

import UIKit

class AccountViewController: CodeAcademyViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var accountNameTextField: UITextField!
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var removeFriendButton: UIButton!
    @IBOutlet weak var showFriendsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var account: Account?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = account?.username
        
    }
    /*
     You should add your implementation here for setting username in the Account view.
     
     You can do that by writing usernameLabel.text = <your String goes here>
     For example, usernameLabel.text = account.userName
     */
    
    
    // MARK: - IBActions
    
    /*
     I believe that at this point you already have an idea what these functions do.
     Once again, you do not need to modify their names, parameters etc. Your implementation should go inside of them.
     
     Remember, we have a variable called friends on our Account class.
     */
    
    @IBAction func addFriendButtonTapped(_ sender: Any) {
        /*
         Your implementation for adding a new friend.
         You can retrieve that new friend username from accountNameTextField.text
         */
        guard let name = accountNameTextField.text, !name.isEmpty else {
            showWarning(text: "Account not find")
            return
        }
        accountNameTextField.text = nil
         AccountManager.findAccount(username: name, completion: { [weak self] isExist, account in
             guard let account = account else {
                 self?.showWarning(text: "Account not find")
                 return
             }
             guard let currentAccount = self?.account else {
                 self?.showWarning(text: "Account not find")
                 return
             }
            
             guard !currentAccount.isFriends(withAccount: account) else {
                 self?.showWarning(text: "You already friends")
                 return
             }
             
             self?.account?.addFriend(account: account)
             self?.showWarning(text: "You are friends")
        })
        
    }
    
    @IBAction func removeFriendButtonTapped(_ sender: Any) {
        /*
         Your implementation for removing a friend.
         You can retrieve that new friend username from accountNameTextField.text
         */
        guard let name = accountNameTextField.text, !name.isEmpty else {
            showWarning(text: "Account not find")
            return
        }
        accountNameTextField.text = nil
        AccountManager.findAccount(username: name, completion: { [weak self] isExist, account in
            guard let account = account else {
                self?.showWarning(text: "Account not find")
                return
            }
            guard let currentAccount = self?.account else {
                self?.showWarning(text: "Account not find")
                return
            }
           
            guard currentAccount.isFriends(withAccount: account) else {
                self?.showWarning(text: "You are not friends")
                return
            }
            self?.account?.removeFriend(account: account)
            self?.showWarning(text: "Friend removed")
       })
        
    }

    
    @IBAction func showFriendsButtonTapped(_ sender: Any) {
        /*
         Your implementation for showing all the friends on this account.
         You can use print() to print the result to the console
     */
        guard let account = account else {
            showWarning(text: "Account not find")
            return
        }
        
        guard let friends = account.friends, !friends.isEmpty else {
            showWarning(text: "Frieds list is empty")
            return
        }
//        friends.forEach { friend in
//            print(friend.username, "\n")
//        }
        let friendsName = friends.reduce("") { partialResult, friend in
            return partialResult + " _ " + friend.username
        }
        print(friendsName)
    }
    
    @IBAction func accountPreferencesTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AccountPreferences", bundle: nil)
                
                if let accountViewController = storyboard.instantiateViewController(identifier: "AccountPreferencesViewController") as? AccountPreferencesViewController {
                    accountViewController.account = account
                    accountViewController.onDetailsSaved = { details in
                        self.didGetAccountPrefs(details: details)
                    }
                    present(accountViewController, animated: true)
                }
            }
            
            func didGetAccountPrefs(details: AccountDetails) -> () {
                print("did get details")
            }
    /*
     You DO NOT need to do any modifications here
     */
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        present(mainViewController, animated: true)
    }
    
}
