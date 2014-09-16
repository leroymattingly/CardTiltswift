//
//  UIViewExtensions.swift
//  CardTilt
//
//  Created by LeRoy Mattingly on 9/15/14.
//  Copyright (c) 2014 RayWenderlich.com. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // Move our fade out code from earlier
    func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        self.alpha = 0.0
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)    }
    
    func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    
    func tipIn(degreesToRotate: Float = -15.0, offsetX: Float = -20.0, offsetY: Float = -20.0, opacity: Float = 0.6, duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        let rotationRadians: CGFloat = CGFloat(degreesToRotate) * (CGFloat(M_PI)/180.0)
        var startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, CGFloat(offsetX), CGFloat(offsetY), 0.0)
        self.layer.transform = startTransform
        self.layer.opacity = opacity
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.layer.opacity = 1
            self.layer.transform = CATransform3DIdentity
            }, completion: completion)
    }
    
    func rotate(degreesToRotate: Float = 180.0, duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        let rotationRadians: CGFloat = CGFloat(degreesToRotate) * (CGFloat(M_PI)/180.0)
        var startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0)
        self.layer.transform = startTransform
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.layer.transform = CATransform3DIdentity
            }, completion: completion)
    }

}