//
//  Segment.swift
//  11.7
//
//  Created by user on 13.05.21.
//

import UIKit

protocol SegmentDelegate: NSObjectProtocol {
    func segmentSelected(_ segment: Segment, _ state: Segment.State)
}
//@IBDesignable
 class Segment: UIView {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var checkButtonOne: NSLayoutConstraint!
    @IBOutlet weak var checkButtonTwo: NSLayoutConstraint!
    @IBInspectable var backColor: UIColor = .blue
    @IBInspectable var frontColor: UIColor = .red
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBInspectable var firstButtonText: String = "First"
    @IBInspectable var secondButtonText: String = "Second"
    
        
    weak var delegate: SegmentDelegate?
    enum State {
        case first, second
    }
    var state: State = State.first
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.cornerRadius = 10
        frontView.layer.cornerRadius = 9
        checkButtonOne.priority = UILayoutPriority(rawValue: 950)
        backView.backgroundColor = backColor
        frontView.backgroundColor = frontColor
        firstButton.setTitle(firstButtonText, for: .normal)
        secondButton.setTitle(secondButtonText, for: .normal)
    }
    
    @IBAction func first(_ sender: Any) {
        checkButtonOne.priority = UILayoutPriority(rawValue: 950)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 750)
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        state = .first
        delegate?.segmentSelected(self, state)
        
    }
    @IBAction func second(_ sender: Any) {
        checkButtonOne.priority = UILayoutPriority(rawValue: 750)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 950)
        UIView.animate(withDuration: 0.5) {
        self.layoutIfNeeded()
        }
        state = .second
        delegate?.segmentSelected(self, state)
    }
    
    static func loadFromNIB() -> Segment{
        let nib = UINib(nibName: "Segment", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Segment
    }

}
