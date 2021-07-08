//
//  LabelViewController.swift
//  9.8
//
//  Created by user on 7.05.21.
//

import UIKit

class LabelViewController: UIViewController {

    
    @IBOutlet weak var heightLabelConstraint: NSLayoutConstraint!
    var i: Bool = false
  
    @IBAction func showHide(_ sender: Any) {
    
        if !i{
        heightLabelConstraint.constant *= 5
            i = true
        } else{
            heightLabelConstraint.constant /= 5
            i = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
