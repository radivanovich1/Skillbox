//
//  SelectColorViewController.swift
//  7.7
//
//  Created by user on 2.05.21.
//

import UIKit

protocol ColorDelegate {
    func setColor(_ color:String)
}

class SelectColorViewController: UIViewController {
   
    var delegate: ColorDelegate?
    @IBOutlet weak var CurrentColor: UILabel!
    var color: String = ""
    
    @IBAction func setGreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.setColor("Выбран зелёный")
    }
    
    @IBAction func setBlue(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.setColor("Выбран синий")
    }
    
    @IBAction func setRed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.setColor("Выбран красный")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentColor.text = color 
    }
 
}
