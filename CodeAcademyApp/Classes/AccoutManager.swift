//
//  AccoutManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

struct AccountManager {
  
  typealias BoolCompletion = (Bool) -> Void
  
  static func registerAccount(_ account: Account, completion: BoolCompletion) {
    //Check with guard username is not empty and password is secure
    guard !account.username.isEmpty || account.isPasswordSecure else {
      completion(false)
      return
    }
    // Check if the account already exists in all databases
    let verifiedAccountExists = LocalDatabase.verifiedAccounts.contains(where: { $0.username == account.username })
    let unverifiedAccountExists = LocalDatabase.unverifiedAccounts.contains(where: { $0.username == account.username })
    let blockedAccountExists = LocalDatabase.blockedAccounts.contains(where: { $0.username == account.username })
    let deactivatedAccountExists = LocalDatabase.deactivatedAccounts.contains(where: { $0.username == account.username })
    if verifiedAccountExists || unverifiedAccountExists || blockedAccountExists || deactivatedAccountExists {
      completion(false)
      return
    }
    //Add account in unverified database.
    LocalDatabase.unverifiedAccounts.append(account)
    completion(true)
  }
  
  /*
   func registerAccount
   
   Firstly, you need to check if all required fields are provided.
   Secondly, you need to check if the password is secure. More about that in the Account class.
   Finally, you need to check if an account with that username is not already present in our LocalDatabase.
   Keep in mind, that in our local database we have several types of users: verified, unverified, blocked etc.
   
   I also want you to have a completion in function parameters which indicates if the registration was successful or not
   */
  
  /*
   func verifyAccount
   
   Firstly, check if this account exists in our database at all
   Secondly, you need to remove it from unverified accounts and move to verified ones
   
   Once again, please use completion to indicate if the operation was successful or not
   */
  
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

