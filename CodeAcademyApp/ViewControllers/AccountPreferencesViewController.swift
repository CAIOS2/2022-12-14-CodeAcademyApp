//
//  AccountPreferencesViewController.swift
//  CodeAcademyApp
//
//  Created by Andrius J on 2022-12-19.
//tails

import UIKit
/*
 
 Reikia perduoti duomenis atgal i AccountViewController panaudojant closure arba protocol
 Turi buti perduodami username, name, surname, email ir password (reikia susikurit duomenu tipa sitiem duomenim perduot atgal (klase ar struct?))
 Ir tada jau Account view controllery paupdatint accounto duomenis
 Perdavimas turi vykti ant saveButtonTapped

 */

struct AccountDetails {
    let username: String
}
    

class AccountPreferencesViewController: CodeAcademyViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    var account: Account?
    // protokolas arba closure atsiranda cia
    var onDetailsSaved: ((AccountDetails) -> ())?
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        onDetailsSaved?(AccountDetails(username: usernameTextField.text!))
               
        returnToMainView()
    }

    private func returnToMainView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        present(mainViewController, animated: true)
    }
}
