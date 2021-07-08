//
//  ButtonView.swift
//  11.7
//
//  Created by user on 12.05.21.
//
import UIKit

@IBDesignable
class ButtonView: UIButton {
 
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet { layer.borderWidth = borderWidth}
    }
    @IBInspectable var buttonBorderColor: UIColor = .black {
        didSet { layer.borderColor = buttonBorderColor.cgColor }
    }
    @IBInspectable var buttonCorner: CGFloat = 10{
        didSet { layer.cornerRadius = buttonCorner }
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
    }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            layer.borderWidth = borderWidth
            backgroundColor = .green
        }
    

}
