//
//  loadingAnimationView.swift
//  UI_project
//
//  Created by Дмитрий on 27.09.2021.
//

import UIKit

class loadingAnimationView: UIView {


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.DrawCircle()
        
        
    }
    
    private func DrawCircle(){
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.blue.cgColor)
        let path = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 20, height: 20))
        path.fill()
        path.close()
        
        
    }

}
