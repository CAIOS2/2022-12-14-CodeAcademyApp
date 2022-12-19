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

        /*
         You should add your implementation here for setting username in the Account view.

         You can do that by writing usernameLabel.text = <your String goes here>
         For example, usernameLabel.text = account.userName
         */
    }

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
        guard let account = account else {return}
        guard let friendAccountName = accountNameTextField.text else {return}
        
        guard let friend = LocalDatabase.verifiedAccounts.first(where:{ $0.username == friendAccountName }) else {
            print("No friend account in database")
            return
        }
        
        guard !account.isFriends(withAccount: friend) else {
            print("Friend was added before")
           return
        }
        
        account.addFriend(account: friend)
        print("\(friendAccountName) succesfully added")
    }

    @IBAction func removeFriendButtonTapped(_ sender: Any) {
        /*
         Your implementation for removing a friend.
         You can retrieve that new friend username from accountNameTextField.text
         */
        
        guard let account = account else {return}
        guard let friendAccountName = accountNameTextField.text else {return}
        
        guard let friend = LocalDatabase.verifiedAccounts.first(where:{ $0.username == friendAccountName }) else {
            print("No friend account in database")
            return
        }
        
        guard account.isFriends(withAccount: friend) else {
            print("Friend doesn't exist")
           return
        }
        
        account.removeFriend(account: friend)
    }

    @IBAction func showFriendsButtonTapped(_ sender: Any) {
        /*
         Your implementation for showing all the friends on this account.
         You can use print() to print the result to the console
         */
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
