//
//  ViewController.swift
//  CBPacManCircleTest
//
//  Created by Carla Alexander on 2015-02-15.
//  Copyright (c) 2015 CarlaAlexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pacman              = Pacman()
    let pacmanSize:CGFloat  = 25 //CGFloat(25 + (arc4random() % 50)) ... maybe I want a randomly-sized pacman in the future??
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drawPacMan()
        animatePacManPosition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func drawPacMan(){
        
        let circleX         = CGFloat(0) //(self.view.frame.size.width/2)-(pacmanSize/2)
        let circleY         = (self.view.frame.size.height/2)-(pacmanSize/2)
        let circleCenter    = CGPointMake(circleX, circleY);
        
        pacman = Pacman(frame: CGRectMake(circleCenter.x, circleCenter.y, pacmanSize, pacmanSize))
        view.addSubview(pacman)
    }
    
    // TODO: add touch location as param for end position
    
    func animatePacManPosition(){
        
        let offscreenPosition = self.view.frame.width+self.pacmanSize
        
        UIView.animateWithDuration(1.7, animations: { () -> Void in
            self.pacman.frame = CGRect(x: offscreenPosition, y: self.pacman.frame.origin.y, width: self.pacmanSize, height: self.pacmanSize)
            }, completion: nil)
    }
}

