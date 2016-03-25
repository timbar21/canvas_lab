//
//  ViewController.swift
//  canvas
//
//  Created by Tim Barnard on 3/24/16.
//  Copyright © 2016 tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    @IBOutlet var parentView: UIView!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayCenterWhenOpen = CGPoint(x: trayView.center.x, y: trayView.center.y)
        trayCenterWhenClosed = CGPoint(x: trayView.center.x,y: trayView.center.y+200)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onPanTrayGesture(sender: UIPanGestureRecognizer) {
         onTrayPanGesture(sender)
    }
    func onTrayPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view's coordinate system
        let point = panGestureRecognizer.locationInView(parentView)
        // Total translation (x,y) over time in parent view's coordinate system
        let translation = panGestureRecognizer.translationInView(parentView)
        var trayOriginalCenter: CGPoint! = trayView.center

      
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = trayView.center
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            if (panGestureRecognizer.velocityInView(trayView).y > 0){
                
                //animate down
                UIView.animateWithDuration(1, animations: {
                    self.trayView.center = self.trayCenterWhenClosed
                    
                    
                })
            }
            else
            {
             //animate up
                UIView.animateWithDuration(1, animations: {
                    self.trayView.center = self.trayCenterWhenOpen
                    
                    
                })
            }
            print("Gesture changed at: \(point)")
            //trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)

        
        
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            trayView.center = trayOriginalCenter
            print (trayOriginalCenter)
            print("Gesture ended at: \(point)")
        }
    }
}

