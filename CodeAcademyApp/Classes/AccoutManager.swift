//
//  AccoutManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import Foundation

struct AccountManager {

    /*
     func registerAccount

     Firstly, you need to check if all required fields are provided.
     Secondly, you need to check if the password is secure. More about that in the Account class.
     Finally, you need to check if an account with that username is not already present in our LocalDatabase.
     Keep in mind, that in our local database we have several types of users: verified, unverified, blocked etc.

     I also want you to have a completion in function parameters which indicates if the registration was successful or not
     */
    
    static func registerAccount (username: String,
                                 name: String,
                                 surname: String,
                                 password: String,
                                 profilePictureURL: URL? ,
                                 friends: [Account]?,
                                 completion: (Bool) -> Void) {
        
        guard username != "", name != "", surname != "", password != "" else { completion(false); return }
        
        guard (LocalDatabase.verifiedAccounts.first { $0.username == username} == nil)  else {completion(false); return}
        guard (LocalDatabase.unverifiedAccounts.first { $0.username == username} == nil)  else {completion(false); return}
        guard (LocalDatabase.blockedAccounts.first { $0.username == username} == nil)  else {completion(false); return}
        guard (LocalDatabase.blockedAccounts.first { $0.username == username} == nil)  else {completion(false); return}
        
        let account = Account(username: username, name: name, surname: surname, password: password, profilePictureURL: profilePictureURL, friends: friends )
        completion(true)
    }

    /*
     func verifyAccount

     Firstly, check if this account exists in our database at all
     Secondly, you need to remove it from unverified accounts and move to verified ones

     Once again, please use completion to indicate if the operation was successful or not
     */
    func verifyAccount(_ account: Account, completion: (Bool) -> Void) {
        guard LocalDatabase.unverifiedAccounts.first(where: {$0.username == account.username}) != nil else {completion(false)
            return}
        
        
    }
    /*
     func blockAccount

     Implementation details are up to you
     Please use completion as in the ones above
     */

    /*
     func deactivateAccount

     Implementation details are up to you
     Please use completion as in the ones above
     */
}

