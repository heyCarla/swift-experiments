//
//  Pacman.swift
//  CBPacManpacmanTest
//
//  Created by Carla Alexander on 2015-02-15.
//  Copyright (c) 2015 CarlaAlexander. All rights reserved.
//

import UIKit

class Pacman: UIView {
    
    var pacman = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let radius      = CGFloat(min(self.frame.size.width,self.frame.size.height)/2)
        let startAngle  = CGFloat(0)
        let endAngle    = CGFloat(2 * M_PI)

        pacman.path         = UIBezierPath(arcCenter: CGPointMake(0, 0), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        pacman.fillColor    = UIColor.whiteColor().CGColor
        pacman.strokeColor  = UIColor.yellowColor().CGColor
        pacman.lineWidth    = radius*2
        pacman.fillMode     = kCAFillModeForwards
        
        animatePacMan()
        
        self.layer.addSublayer(pacman)
    }
    
    func animatePacMan(){
        
        let animationDuration   = 0.5
        let timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        // stroke start animation
        let startAnimation              = CAKeyframeAnimation(keyPath: "strokeStart")
        startAnimation.keyTimes         = [0, 0.5, 1]
        startAnimation.timingFunctions  = [timingFunction, timingFunction]
        startAnimation.values           = [0.125, 0, 0.125]
        startAnimation.duration         = animationDuration
        
        // stroke end animation
        let endAnimation                = CAKeyframeAnimation(keyPath: "strokeEnd")
        endAnimation.keyTimes           = [0, 0.5, 1]
        endAnimation.timingFunctions    = [timingFunction, timingFunction]
        endAnimation.values             = [0.875, 1, 0.875]
        endAnimation.duration           = animationDuration
        
        // actual animation
        let animationGroup                   = CAAnimationGroup()
        animationGroup.animations            = [startAnimation, endAnimation]
        animationGroup.duration              = animationDuration
        animationGroup.repeatCount           = HUGE
        animationGroup.removedOnCompletion   = false
        
        pacman.addAnimation(animationGroup, forKey: "animationGroup")
    }
}
