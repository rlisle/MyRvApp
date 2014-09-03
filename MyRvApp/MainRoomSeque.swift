//
//  MainRoomSeque.swift
//  MyRvApp
//
//  Created by Ron Lisle on 8/27/14.
//  Copyright (c) 2014 Ron Lisle. All rights reserved.
//

import UIKit

class MainRoomSeque: UIStoryboardSegue {
    
//    var originatingPoint: CGPoint
    
    override func perform() {
        
        let sourceVC = self.sourceViewController as UIViewController
        let destinationVC = self.destinationViewController as UIViewController
        
        // Add the destination view as a subview temporarily
        sourceVC.view.addSubview(destinationVC.view)
        
        // Transformation start scale
        destinationVC.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        // Store original center point of the destination view
        let originalCenter = destinationVC.view.center
        // Set center to start point of the button
//        destinationVC.view.center = self.originatingPoint
        destinationVC.view.center = CGPointMake(1136.0/4, 576.0/4)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options:UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                // Grow!
                destinationVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                destinationVC.view.center = originalCenter
            
            }, completion: { (finished: Bool) -> Void in
                destinationVC.view.removeFromSuperview()
                sourceVC.presentViewController(destinationVC, animated: false, completion: nil)
        })
    }
}

