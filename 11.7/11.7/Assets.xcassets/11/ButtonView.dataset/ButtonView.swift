//
//  ButtonView.swift
//  11.7
//
//  Created by user on 12.05.21.
//
import UIKit

//@IBDesignable
class ButtonView: UIView {
    var button = UIButton()
    var isSetuped = false
    @IBInspectable var buttonWidth: CGFloat = 100 {
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var buttonBorderColor: UIColor = .black {
        didSet { button.layer.borderColor = buttonBorderColor.cgColor }
    }
    @IBInspectable var buttonCorner: CGFloat = 10{
        didSet { button.layer.cornerRadius = buttonCorner }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
        button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: 60))
        button.layer.borderWidth = 2
        button.backgroundColor = .blue
        button.setTitle("button", for: .normal)
        self.addSubview(button)
        
        if isSetuped { return }
        isSetuped = true
    }

}
