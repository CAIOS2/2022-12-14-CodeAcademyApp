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

    var didSavePreferences: ((AccountPreferences) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let account = account {
            
            usernameTextField.text = account.username
            nameTextField.text = account.name
            surnameTextField.text = account.surname
            passwordTextField.text = account.password
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let prefs = savePreferences() else {return}
        guard let didSavePreferences = didSavePreferences else {return}
        didSavePreferences(prefs)
        returnToMainView()
    }
    
    private func returnToMainView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        present(mainViewController, animated: true)
    }
    
    private func savePreferences () -> AccountPreferences? {
        
        guard let username = usernameTextField.text, let name = nameTextField.text, let surname = surnameTextField.text,
              let password = passwordTextField.text else {return nil}
        
        return AccountPreferences(username: username,
                                  name: name,
                                  surname: surname,
                                  password: password)
    }
}
