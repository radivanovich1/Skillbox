//
//  ViewController.swift
//  13.6
//
//  Created by user on 19.05.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var coubView: UIView!
    @IBOutlet weak var currentAnimLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prevButton.isEnabled = false

    }
    var i = 0
    func animations(i: Int) {
        switch i {
        case 1:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            colorAnim()
            prevButton.isEnabled = false
        case 2:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            positionAnim()
            prevButton.isEnabled = true
        case 3:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            cornerAnim()
        case 4:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            rotationAnim()
        case 5:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            alphaAnim()
        case 6:
            self.coubView.transform = CGAffineTransform.identity
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            sizeAnim()
            nextButton.isEnabled = true

        case 7:
            self.coubView.layer.removeAllAnimations()
            self.coubView.layoutIfNeeded()
            repetrotationAnim()
            nextButton.isEnabled = false
        default:
            colorAnim()
        }
    }
    

    @IBAction func prevAnim(_ sender: Any) {
        if i > 1 {i -= 1}
        animations(i: i)
        currentAnimLabel.text = String(i)
    }
    @IBAction func nextAnim(_ sender: Any) {
        if i < 7 {i += 1}
        animations(i: i)
        currentAnimLabel.text = String(i)
    }
    
    func colorAnim(){
        
        UIView.animate(withDuration: 2, animations:{
        self.coubView.backgroundColor = .yellow
        }) { (isCompleted) in
            self.coubView.backgroundColor = .red
        }
    }
    func positionAnim(){
        
        UIView.animate(withDuration: 2, animations:{
            self.topConstraint.priority = UILayoutPriority(rawValue: 751)
            self.rightConstraint.priority = UILayoutPriority(rawValue: 751)
            self.view.layoutIfNeeded()
        }){ (isCompleted) in
            self.topConstraint.priority = UILayoutPriority(rawValue: 749)
            self.rightConstraint.priority = UILayoutPriority(rawValue: 749)
        }
    }
    func cornerAnim(){
       
        let animationCorner = CABasicAnimation(keyPath: "cornerRadius")
        animationCorner.duration = CFTimeInterval(2)
        animationCorner.fromValue = 0
        animationCorner.toValue = coubView.layer.bounds.width / 2
        animationCorner.fillMode = .forwards
        coubView.layer.add(animationCorner , forKey: "cornerRadius")
        coubView.layer.cornerRadius = coubView.layer.bounds.width / 2
        coubView.layer.cornerRadius = 0
    }
    func rotationAnim()  {
        UIView.animate(withDuration: 2, animations:{
            self.coubView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }){ (isCompleted) in
            self.coubView.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
        }
    }
    func alphaAnim(){
        UIView.animate(withDuration: 2, animations:{
            self.coubView.alpha = 0
        }){ (isCompleted) in
            self.coubView.alpha = 1
           
        }
    }
    func sizeAnim()  {
        
        UIView.animate(withDuration: 1,  animations:{
            
            self.coubView.transform = CGAffineTransform(scaleX: 4, y: 4)
          
            })
        UIView.animate(withDuration: 1, animations:{
            
            self.coubView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            })
        
    }
    func repetrotationAnim()  {
        UIView.animate(withDuration: 2, delay: 0, options:[.repeat], animations:{
            self.coubView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }){ (isCompleted) in
            self.coubView.transform = CGAffineTransform(rotationAngle: 0)}
       
    }
}


