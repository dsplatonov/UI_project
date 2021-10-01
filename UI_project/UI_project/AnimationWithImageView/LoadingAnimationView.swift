//
//  LoadingAnimationView.swift
//  UI_project
//
//  Created by Дмитрий on 01.10.2021.
//

import UIKit

class LoadingAnimationView: UIView {

    var shapeLayer: CAShapeLayer?
    var duration: CFTimeInterval = 2
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return
//        }
        
        let path = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 50, height: 50))
//        path.stroke()
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.lineWidth = 5
        layer.fillColor = nil
        layer.lineCap = .round
        self.layer.addSublayer(layer)
        self.shapeLayer = layer
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1.5
//        animation.duration = 1.5
//        animation.repeatCount = .infinity
        
        let animationSecond = CABasicAnimation(keyPath: "strokeStart")
        animationSecond.fromValue = 0
        animationSecond.toValue = 1
//        animationSecond.duration = 2
//        animationSecond.repeatCount = .infinity
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation, animationSecond]
        animationGroup.duration = 2
        animationGroup.repeatCount = .infinity
        animationGroup.fillMode = .backwards
        
        self.shapeLayer?.add(animationGroup, forKey: nil)
    }

}
