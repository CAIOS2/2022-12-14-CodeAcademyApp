//
//  LocalDatabase.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

/*
 Bonus task: now we have 4 arrays to store different types of accounts
 Do we really need separate arrays?
 Maybe we can have one array to serve all the types?
*/

struct LocalDatabase {
    static var unverifiedAccounts = [Account]()
    static var verifiedAccounts = [Account]()
    static var blockedAccounts = [Account]()
    static var deactivatedAccounts = [Account]()
}
