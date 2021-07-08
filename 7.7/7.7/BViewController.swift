//
//  BViewController.swift
//  7.7
//
//  Created by user on 2.05.21.
//

import UIKit

class BViewController: UIViewController {

    
    @IBOutlet weak var colorLabel: UILabel!
    var color: String = ""
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let vc = segue.destination as? SelectColorViewController, segue.identifier == "SelectColorView"{
            vc.color = colorLabel.text!
            vc.delegate = self
            
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension BViewController: ColorDelegate{
    
    func setColor(_ color:String){
        colorLabel.text = color
    }
    
}
