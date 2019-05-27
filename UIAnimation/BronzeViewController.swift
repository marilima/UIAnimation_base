//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Pedro Giuliano Farina on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class BronzeController:UIViewController{
    static var blueColor:UIColor = #colorLiteral(red: 0.2624790668, green: 0.3596034348, blue: 0.4444591403, alpha: 1)
    static var pinkColor:UIColor = #colorLiteral(red: 0.6784313725, green: 0.2117647059, blue: 0.431372549, alpha: 1)
    
    @IBOutlet var rocket : UIImageView!
    @IBOutlet var world : UIImageView!
    
    @IBAction func segmentedClick(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.view.backgroundColor = BronzeController.blueColor
            self.tabBarController?.tabBar.barTintColor = BronzeController.blueColor
            sender.backgroundColor = BronzeController.blueColor
            sender.tintColor = BronzeController.pinkColor
        }
        else{
            self.view.backgroundColor = BronzeController.pinkColor
            self.tabBarController?.tabBar.barTintColor = BronzeController.pinkColor
            sender.backgroundColor = BronzeController.pinkColor
            sender.tintColor = BronzeController.blueColor
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.image = UIImage(named: "rocket")
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = 0
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height   
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let newYPosition = self.world.center.y - self.world.frame.size.height/2
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.rocket.center.x, y: (self.rocket.center.y + self.rocket.frame.size.height/2)))
        path.addLine(to: CGPoint(x:self.rocket.center.x, y: newYPosition + self.rocket.frame.size.height/2))
        
        let smokeLayer = CAShapeLayer()
        smokeLayer.strokeColor = UIColor.gray.cgColor
        smokeLayer.lineWidth = 3
        smokeLayer.fillColor = UIColor.clear.cgColor
        smokeLayer.path = path
        smokeLayer.strokeStart = 0.93
        
        self.view.layer.addSublayer(smokeLayer)
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.07
        myEndAnimation.toValue = 1.0
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.93
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        
        smokeLayer.add(animationGroup, forKey: "drawLine")
        
        UIView.animate(withDuration: 3, delay: 0, options: [.curveLinear] , animations: {
            self.rocket.center.y = newYPosition - self.rocket.frame.size.height/2
        }) { finished in
            self.rocket.image = UIImage(named: "rocket2")
            smokeLayer.removeFromSuperlayer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.barTintColor = BronzeController.blueColor
    }
}
