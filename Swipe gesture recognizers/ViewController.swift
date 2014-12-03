//
//  ViewController.swift
//  Swipe gesture recognizers
//
//  Created by Mav3r1ck on 12/1/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var redBall: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            
            case UISwipeGestureRecognizerDirection.Up:
                println("Swiped up")
                redBall.center.y -= 60
            self.redBall.transform = CGAffineTransformMakeTranslation(0, 100)
            springWithDelay(0.9, 0.25, {
                    self.redBall.transform = CGAffineTransformMakeTranslation(0, 0)
                })
                
            case UISwipeGestureRecognizerDirection.Down:
                println("Swiped down")
                redBall.center.y += 60
                self.redBall.transform = CGAffineTransformMakeTranslation(0, -100)
                springWithDelay(0.9, 0.25, {
                    self.redBall.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            case UISwipeGestureRecognizerDirection.Left:
                println("Swiped left")
                redBall.center.x -= 60
                self.redBall.transform = CGAffineTransformMakeTranslation(100, 0)
                springWithDelay(0.9, 0.25, {
                    self.redBall.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            case UISwipeGestureRecognizerDirection.Right:
                println("Swiped right")
                redBall.center.x += 60
                self.redBall.transform = CGAffineTransformMakeTranslation(-100, 0)
                springWithDelay(0.9, 0.25, {
                    self.redBall.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            default:
                break
            }
        }

    }
    
}
