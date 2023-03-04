//
//  CodeAcademyViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-13.
//

import UIKit

/*
 You do not need to do any modifications here.
 Bonus question: Why did I even bother to create this class?
 */

class CodeAcademyViewController: UIViewController, UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showAlert(message: String) {
           showAlert(title: "Title", message: message)
       }
       
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "ok", style: .cancel)
           alert.addAction(action)
           present(alert, animated: true)
       }
}
