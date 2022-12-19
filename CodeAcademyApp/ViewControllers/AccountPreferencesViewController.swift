//
//  AccountPreferencesViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-16.
//

import UIKit
/*
 
 Reikia perduoti duomenis atgal i AccountViewController panaudojant closure arba protocol
 Turi buti perduodami username, name, surname, email ir password (reikia susikurit duomenu tipa sitiem duomenim perduot atgal (klase ar struct?))
 Ir tada jau Account view controllery paupdatint accounto duomenis
 Perdavimas turi vykti ant saveButtonTapped
 
 */
class AccountPreferencesViewController: CodeAcademyViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    var account: Account?
    // protokolas arba closure atsiranda cia
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        returnToMainView()
    }

    private func returnToMainView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        present(mainViewController, animated: true)
    }
}
