//
//  AccoutManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import UIKit

struct AccountManager {
    
    typealias BoolCompletion = (Bool) -> Void
    
    static func registerAccount(_ account: Account, completion: BoolCompletion) {
        if account.username.isEmpty || !account.isPasswordSecure {
            completion(false)
            return
        }
        // Check these

//        LocalDatabase.verifiedAccounts.contains(where: <#T##(Account) throws -> Bool#>)
//        LocalDatabase.unverifiedAccounts.contains(where: <#T##(Account) throws -> Bool#>)
//        LocalDatabase.blockedAccounts.contains(where: <#T##(Account) throws -> Bool#>)
//        LocalDatabase.deactivatedAccounts.contains(where: <#T##(Account) throws -> Bool#>)
        LocalDatabase.unverifiedAccounts.append(account)
        LocalDatabase.unverifiedAccounts.append(account)
        completion(true)
    }

    static func verifyAccount(_ account: Account, completion: BoolCompletion) {
        let accountExists = LocalDatabase.unverifiedAccounts.contains { unverifiedAccount -> Bool in
            return unverifiedAccount.username == account.username
        }
        guard accountExists else {
            completion(false)
            return
        }
        LocalDatabase.unverifiedAccounts.removeAll {
            $0.username == account.username
        }
        LocalDatabase.verifiedAccounts.append(account)
        completion(true)
    }

    static func blockAccount (account: Account, completion: BoolCompletion) {
        let accountExists = LocalDatabase.verifiedAccounts.contains { verifiedAccount -> Bool in
            return verifiedAccount.username == account.username
        }
        guard accountExists else {
            completion(false)
            return
        }
        LocalDatabase.verifiedAccounts.removeAll {
            $0.username == account.username
        }
        LocalDatabase.blockedAccounts.append(account)
        completion(true)
    }

}

