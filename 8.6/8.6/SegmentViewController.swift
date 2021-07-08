//
//  SegmentViewController.swift
//  8.6
//
//  Created by user on 5.05.21.
//

import UIKit

class SegmentViewController: UIViewController, UITextFieldDelegate
 {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
  
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.firstTextField.delegate = self
        self.secondTextField.delegate = self
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
            thirdView.isHidden = true
            firstTextField.resignFirstResponder()
            secondTextField.resignFirstResponder()
        case 2:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = false
            firstTextField.resignFirstResponder()
            secondTextField.resignFirstResponder()
        
        default:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            firstTextField.resignFirstResponder()
            secondTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
}
