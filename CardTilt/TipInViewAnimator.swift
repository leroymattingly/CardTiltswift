//
//  TipInCellAnimator.swift
//  CardTilt
//
//  Created by LeRoy Mattingly on 9/14/14.
//  Copyright (c) 2014 RayWenderlich.com. All rights reserved.
//

import UIKit

class TipInViewAnimator {
    var rotationDegrees:CGFloat = -15.0
    var offset:CGPoint = CGPointMake(-20, -20)
    var opacity:Float = 0.6
    var duration:Float = 1.0
    private var startTransform = CATransform3DIdentity
    
    init() {
        calculateNewTransform()
    }
    
    init(degreesToRotate: Double, offsetX: Double, offsetY: Double) {
        self.setStartTransform(degreesToRotate: degreesToRotate, offsetX: offsetX, offsetY: offsetY)
        calculateNewTransform()
    }
    
    func setStartTransform(#degreesToRotate: Double, offsetX: Double, offsetY: Double) {
        
        self.rotationDegrees = CGFloat(degreesToRotate)
        self.offset = CGPointMake(CGFloat(offsetX), CGFloat(offsetY))
        calculateNewTransform()
    }
    
     func animate(view:UIView) {
        view.layer.transform = startTransform
        view.layer.opacity = self.opacity
        UIView.animateWithDuration(0.8) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
    
    private func calculateNewTransform() {
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
    }
}