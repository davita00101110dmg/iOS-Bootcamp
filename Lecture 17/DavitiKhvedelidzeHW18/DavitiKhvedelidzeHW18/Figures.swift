//
//  Figures.swift
//  DavitiKhvedelidzeHW17
//
//  Created by Dato Khvedelidze on 19.07.22.
//

import UIKit


func drawCircle(circle: UIView, color: UIColor) {
    
    circle.backgroundColor = .clear
    let path = UIBezierPath(ovalIn: circle.bounds)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.fillColor = color.cgColor
    shapeLayer.lineWidth = 1
    shapeLayer.strokeColor = UIColor.black.cgColor
    
    
    circle.layer.addSublayer(shapeLayer)
}

func drawTriangle(triangle: UIView, color: UIColor) {
    
    triangle.backgroundColor = .clear
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 100))
    path.addLine(to: CGPoint(x: 50, y: 0))
    path.addLine(to: CGPoint(x: 100, y: 100))
    path.addLine(to: CGPoint(x: 0, y: 100))
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 2
    shapeLayer.strokeColor = UIColor.black.cgColor
    shapeLayer.fillColor = color.cgColor
    
    triangle.layer.addSublayer(shapeLayer)
}
