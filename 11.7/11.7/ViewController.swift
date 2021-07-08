//
//  ViewController.swift
//  11.7
//
//  Created by user on 12.05.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let segment = Segment.loadFromNIB()
        segmentView.addSubview(segment)
        segment.delegate = self
        
    }


}
extension ViewController: SegmentDelegate{
      
    func segmentSelected(_ segment: Segment, _ state: Segment.State) {
        
        print("Selected \(state)")
    }
}

