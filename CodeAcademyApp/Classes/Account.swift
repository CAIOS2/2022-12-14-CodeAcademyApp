//
//  Account.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import Foundation

class Account {

    var username: String
    let name: String
    let surname: String
    var password: String
    var profilePictureURL: URL?
    var friends: [Account]?

    var passwordSetDate: Date

    init(
        username: String,
        name: String,
        surname: String,
        password: String,
        profilePictureURL: URL? = nil,
        friends: [Account]? = nil
    ) {
        self.username = username
        self.name = name
        self.surname = surname
        self.password = password
        self.profilePictureURL = profilePictureURL
        self.friends = friends

        passwordSetDate = Date()
    }
}

// MARK: - Friends functionality

extension Account {

    func isFriends(withAccount account: Account) -> Bool {
        guard let friends = friends else { return false }

        return friends.contains(where: { friend -> Bool in
            return account.username == friend.username
        })
    }

    func addFriend(account: Account) {
        if friends == nil {
            friends = []
        }
        
        friends?.append(account)
        
//        if friends != nil {
//            friends?.append(account)
//        } else {
//            friends = [Account]()
//            friends?.append(account)
//        }
    }

    func removeFriend(account: Account) {
        friends?.removeAll(where: { friend -> Bool in
            return friend.username == account.username
        })
    }
}

// MARK: - Password functionality

extension Account {

    var isPasswordSecure: Bool {
        guard password.count >= 8 else { return false }

        var containsLowercase = false
        var containsUppercase = false
        var containsNumbers = false

        password.forEach { character in
            if character.isLowercase { containsLowercase = true }
            if character.isUppercase { containsUppercase = true }
            if character.isNumber { containsNumbers = true }
        }
        return containsLowercase && containsUppercase && containsNumbers
    }

    var isPasswordExpired: Bool {
        return passwordSetDate.addingTimeInterval(60) < Date()
    }
}
