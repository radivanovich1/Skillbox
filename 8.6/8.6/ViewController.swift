//
//  ViewController.swift
//  8.6
//
//  Created by user on 5.05.21.
//

import UIKit

class ViewController: UIViewController {
   
   
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var galleryImageView: UIImageView!
    let imgArr: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var currentIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryImageView.image = UIImage(named: imgArr[currentIndex])
        prevButton.isEnabled = false
        
    }

    
    @IBAction func prev(_ sender: UIButton) {
        if currentIndex > 0{
            nextButton.isEnabled = true
            currentIndex -= 1
        galleryImageView.image = UIImage(named: imgArr[currentIndex])
        }
        if currentIndex == 0 {
            sender.isEnabled = false
        }
               
    }
 
    @IBAction func next(_ sender: UIButton) {
        
        if currentIndex < imgArr.count - 1{
            prevButton.isEnabled = true
            sender.isEnabled = true
            currentIndex += 1
        galleryImageView.image = UIImage(named: imgArr[currentIndex])
        }
        if currentIndex == imgArr.count - 1 {
            sender.isEnabled = false
        }
    }
        
}

