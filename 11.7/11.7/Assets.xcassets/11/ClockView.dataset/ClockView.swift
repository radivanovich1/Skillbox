//
//  ClockView.swift
//  11.7
//
//  Created by user on 13.05.21.
//

import UIKit

@IBDesignable class ClockView: UIView {
    var isSetuped = false
    var markerSize: CGFloat = 6
    var markerLength: CGFloat = 10
    var markerColor = UIColor.blue
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    @IBInspectable
    var hourLineSize: CGFloat = 5 {
        didSet{layoutIfNeeded()}
    }
    
    @IBInspectable
    var minuteLineSize: CGFloat = 4 {
        didSet{ layoutIfNeeded()}
    }
    
    @IBInspectable
    var secondLineSize: CGFloat = 1 {
        didSet{ layoutIfNeeded()}
    }
    
    @IBInspectable
    var hourLineColor: UIColor = .red{
        didSet{ hourLine.backgroundColor = hourLineColor}        
    }
    
    @IBInspectable
    var minuteLineColor: UIColor = .blue{
        didSet{ minuteLine.backgroundColor = minuteLineColor}
    }
    
    @IBInspectable
    var secondLineColor: UIColor = .red{
        didSet{ secondLine.backgroundColor = secondLineColor}
    }
   
    var hours: CGFloat = 3
    var minutes: CGFloat = 30
    var seconds: CGFloat = 6

    
    override func layoutSubviews() {
        super.layoutSubviews()
        let w: CGFloat = frame.size.width
        let h: CGFloat = frame.size.height
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2, y: 0, width: minuteLineSize, height: h / 2 )
        minuteLine.backgroundColor = minuteLineColor
        updateMinutes()
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: 30, width: hourLineSize, height: h / 2 - 30 )
        hourLine.backgroundColor = hourLineColor
        updateHours()
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: 0, width: secondLineSize, height: h / 2 )
        secondLine.backgroundColor = secondLineColor
        updateSeconds()
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerSize, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor
            addSubview(v)
        }
        addSubview(hourLine)
        addSubview(minuteLine)
        addSubview(secondLine)

        layer.cornerRadius = frame.size.width / 2
        if isSetuped { return }
        isSetuped = true
    }
    func updateHours() {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    func updateMinutes() {
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    func updateSeconds() {
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }

}
