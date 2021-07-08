//
//  ChangeColorChildViewController.swift
//  7.7
//
//  Created by user on 2.05.21.
//

import UIKit

protocol ColorNameDelegate {
    func setColor(_ color: UIColor)
}

class ChangeColorChildViewController: UIViewController {
    
    var delegate: ColorNameDelegate?
    
    @IBAction func setGreen(_ sender: Any) {
       delegate?.setColor(UIColor.green)
    }
    
    @IBAction func setYellow(_ sender: Any) {
        delegate?.setColor(UIColor.yellow)
    }
    
    @IBAction func serPurple(_ sender: Any) {
        delegate?.setColor(UIColor.purple)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
   
}

