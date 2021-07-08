//
//  SecondViewController.swift
//  8.6
//
//  Created by user on 5.05.21.
//

import UIKit

class SecondViewController: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            spawn()
    }
    
    func spawn() {
        var currX: CGFloat = 20
        var currY: CGFloat = 70
        
        for i in 1...4{
            let view1 = UIImageView()
            let title = UILabel()
            title.text = "Car \(i)"
            view1.image = UIImage.init(named: String(i))
            view1.frame = CGRect(x: currX, y: currY - 50, width: 150, height: 150)
            title.frame = CGRect(x: currX, y: currY, width: 150, height: 150)
            view1.contentMode = .scaleAspectFit
            if i % 2 != 0 {
                currX += view1.frame.width + 20
            }  else{
                currX -= view1.frame.width + 20
                currY += view1.frame.height
            }
           
            view.addSubview(title)
            view.addSubview(view1)
        }
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool 
    {
        textField.resignFirstResponder()
        return true;
    }

}
