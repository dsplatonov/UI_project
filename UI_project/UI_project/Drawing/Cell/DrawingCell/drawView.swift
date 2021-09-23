//
//  drawView.swift
//  UI_project
//
//  Created by Дмитрий on 15.09.2021.
//

import UIKit
class drawView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        self.drawCircle(context)
    }
    private func drawCircle(_ context: CGContext){
//        context.setStrokeColor(UIColor.black.cgColor)
//        let newMask = CAShapeLayer()
//        let circlePath = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 50, height: 50))
//        newMask.path = circlePath.cgPath
    }
}
