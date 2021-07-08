//
//  ViewController.swift
//  3.7
//
//  Created by Дмитрий Радиванович on 16.06.21.
//

import UIKit
import Bond

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.reactive.text.ignoreNils().map{ [unowned self] in
            self.isValidEmail($0) ? "" : "Bad email"
        }.bind(to: messageLabel)
        passwordTextField.reactive.text.ignoreNils().map{
            $0.count >= 6 ? "" : "Bad password"
        }.bind(to: messageLabel)
        
        loginTextField.reactive.text.ignoreNils().combineLatest(with: passwordTextField.reactive.text.ignoreNils()).map {
            if $0.0.contains("@") && $0.1.count >= 6 {
                    return true
                }
                else{
                    return false
                }
                }.bind(to: sendButton.reactive.isEnabled)
    
        
        searchTextField.reactive.text.ignoreNils().throttle(for: 0.5).observeNext{ $0.isEmpty ? nil : print("Send for: \($0)")}
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

