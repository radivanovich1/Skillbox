//
//  ChangeColorViewController.swift
//  7.7
//
//  Created by user on 2.05.21.
//

import UIKit



class ChangeColorViewController: UIViewController {

 
    var chlid: ChangeColorChildViewController?
    
    @IBAction func setGreen(_ sender: Any) {
        chlid?.view.backgroundColor = UIColor.green
    }
    
    @IBAction func setYellow(_ sender: Any) {
        chlid?.view.backgroundColor = UIColor.yellow
    }
    
    @IBAction func setPurple(_ sender: Any) {
        chlid?.view.backgroundColor = UIColor.purple
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let childVC = segue.destination as? ChangeColorChildViewController, segue.identifier == "ChangeColor"{
            chlid = childVC
            childVC.delegate = self
        }
    }

}
extension ChangeColorViewController: ColorNameDelegate{

    func setColor(_ color: UIColor){
        view.backgroundColor = color
    }
    
}
