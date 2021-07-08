//
//  ViewController.swift
//  6.7
//
//  Created by user on 30.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var operationTextField: UITextField!
    @IBOutlet weak var callcLabel: UILabel!
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var powNumber : Int = 0
    
    @IBAction func calculate(_ sender: Any) {
        if firstNumberTextField.text != "" && secondNumberTextField.text != ""{
            firstNum = Int(firstNumberTextField.text ?? "") ?? 0
            secondNum = Int(secondNumberTextField.text ?? "") ?? 0
        switch operationTextField.text{
        case "+":
            callcLabel.text = String(firstNum  &+ secondNum)
        case "-":
            callcLabel.text = String(firstNum &- secondNum)
        case "*":
            callcLabel.text = String(firstNum &* secondNum)
        case "/":
            callcLabel.text = String(firstNum / secondNum)
        default:
            callcLabel.text = "Некорректные данные"
        }
        }
        else{
            callcLabel.text = "Некорректные данные"
        }
    }
    @IBAction func power(_ sender: Any) {
        if numberTextField.text != ""{
            powNumber = Int(numberTextField.text ?? "") ?? 0
            resultLabel.text = String( pow( 2, Double(powNumber))).replacingOccurrences(of: ".0", with: "")
        }
        else {
            resultLabel.text = "Введите целое число в строку"
            
        }
    }
    @IBAction func submit(_ sender: Any) {
        nameLabel.text?.append((inputTextField.text ?? "") + " ")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)

    }
    
}

