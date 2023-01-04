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
    
//    lazy var showWarning = {
//        return UIAlertController(title: "Message", message: "eror", preferredStyle: .alert)
//        let action = UIAlertController(title: "Test", message: "Error.", preferredStyle: .alert)
//        action.addAction(UIAlertAction(title: "Test", style: .destructive))
//    }()
    func showWarning(text: String) {
        let alertController = UIAlertController(
            title: "Message",
            message: text,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Close",
            style: .default)
        
        alertController.addAction(action)
        present(alertController, animated: true)

    }
}
    
