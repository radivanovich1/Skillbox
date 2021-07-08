//
//  DViewController.swift
//  3.7
//
//  Created by Дмитрий Радиванович on 16.06.21.
//

import UIKit
import Bond

class DViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var resLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        cButton.reactive.tap
            .map {
                count += 1
                return  String(describing: count)
          }.bind(to: countLabel.reactive.text)
        
        
        firstButton.reactive.tap.combineLatest(with: secondButton.reactive.tap).map{_ in return "Ракета запущена"}.bind(to: resLabel.reactive.text)
        
    }
    
   
    

}
