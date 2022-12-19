//
//  AccoutManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

struct AccountManager {
    
    typealias BoolCompletion = (Bool, Account?) -> Void
    
    
    /*
     func registerAccount
     
     Firstly, you need to check if all required fields are provided.
     Secondly, you need to check if the password is secure. More about that in the Account class.
     Finally, you need to check if an account with that username is not already present in our LocalDatabase.
     Keep in mind, that in our local database we have several types of users: verified, unverified, blocked etc.
     
     I also want you to have a completion in function parameters which indicates if the registration was successful or not
     
     static var unverifiedAccounts = [Account]()
     static var verifiedAccounts = [Account]()
     static var blockedAccounts = [Account]()
     static var deactivatedAccounts = [Account]()
     */
    static func registerAccount(data: Account, completion: @escaping BoolCompletion) {
        guard data.isPasswordSecure && !data.isPasswordExpired else {
            completion(false, data)
            return
        }
        let isUnverified = LocalDatabase.unverifiedAccounts.contains { account in
            return account.username == data.username
        }
        let isVerified = LocalDatabase.verifiedAccounts.contains { account in
            return account.username == data.username
        }
        let isBlocked = LocalDatabase.blockedAccounts.contains { account in
            return account.username == data.username
        }
        let isDeactivated = LocalDatabase.deactivatedAccounts.contains { account in
            return account.username == data.username
        }
        let contains = !isUnverified && !isVerified && !isBlocked && !isDeactivated
        guard contains else {
            completion(false, data)
            return
        }
        LocalDatabase.unverifiedAccounts.append(data)
        
        completion(true, data)
        
    }
    static func loginAccount(username: String, password: String, completion: @escaping BoolCompletion) {
        if let account = LocalDatabase.unverifiedAccounts.first(where: {$0.username == username && $0.password == password} ) {
            completion(true, account)
            
        } else if let account = LocalDatabase.verifiedAccounts.first(where: {$0.username == username && $0.password == password} ) {
            completion(true, account)
            
        } else {
            completion(false, nil)
        }
        
    }
    static func findAccount(username: String, completion: @escaping BoolCompletion) {
        if let account = LocalDatabase.unverifiedAccounts.first(where: {$0.username == username} ) {
            completion(true, account)
            
        } else if let account = LocalDatabase.verifiedAccounts.first(where: {$0.username == username} ) {
            completion(true, account)
            
        } else {
            completion(false, nil)
        }
    }
    
    
        
    /*
     func verifyAccount
     
     Firstly, check if this account exists in our database at all
     Secondly, you need to remove it from unverified accounts and move to verified ones
     
     Once again, please use completion to indicate if the operation was successful or not
     */
    static func verifyAccount(username: String, completion: @escaping BoolCompletion) {
        if let account = LocalDatabase.unverifiedAccounts.first(where: {$0.username == username}) {
           let _ = LocalDatabase.unverifiedAccounts.removeAll(where: {$0.username == username})
            LocalDatabase.verifiedAccounts.append(account)
            completion(true, account)
        } else {
            completion(false, nil)
        }
    }
    
    /*
     func blockAccount
     
     Implementation details are up to you
     Please use completion as in the ones above
     */
    static func blockAccount(username: String, completion: @escaping BoolCompletion) {
        let isBlocked = LocalDatabase.blockedAccounts.contains { account in
            return account.username == username
        }
        let isDeactivated = LocalDatabase.deactivatedAccounts.contains { account in
            return account.username == username
        }
        let contains =  !isBlocked && !isDeactivated
        guard contains else {
            completion(false, nil)
            return
        }
        if let account = LocalDatabase.unverifiedAccounts.first(where: {$0.username == username} ) {
            let _ = LocalDatabase.unverifiedAccounts.removeAll(where: {$0.username == username})
            LocalDatabase.blockedAccounts.append(account)
            completion(true, account)
        } else if let account = LocalDatabase.verifiedAccounts.first(where: {$0.username == username} ) {
            let _ = LocalDatabase.verifiedAccounts.removeAll(where: {$0.username == username})
            LocalDatabase.blockedAccounts.append(account)
            completion(true, account)
        } else {
            completion(false, nil)
        }
        
    }
    
    /*
     func deactivateAccount
     
     Implementation details are up to you
     Please use completion as in the ones above
     */
    static func deactivateAccount(username: String, completion: @escaping BoolCompletion) {
        let isBlocked = LocalDatabase.blockedAccounts.contains { account in
            return account.username == username
        }
        let isDeactivated = LocalDatabase.deactivatedAccounts.contains { account in
            return account.username == username
        }
        let contains =  !isBlocked && !isDeactivated
        guard contains else {
            completion(false, nil)
            return
        }
        if let account = LocalDatabase.unverifiedAccounts.first(where: {$0.username == username} ) {
            let _ = LocalDatabase.unverifiedAccounts.removeAll(where: {$0.username == username})
            LocalDatabase.deactivatedAccounts.append(account)
            completion(true, account)
        } else if let account = LocalDatabase.verifiedAccounts.first(where: {$0.username == username} ) {
            let _ = LocalDatabase.verifiedAccounts.removeAll(where: {$0.username == username})
            LocalDatabase.deactivatedAccounts.append(account)
            completion(true, account)
        } else {
            completion(false, nil)
        }
    }
}

