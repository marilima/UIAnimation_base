//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Amaury A V A Souza on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController{
    
    @IBOutlet weak var moon: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
    
    
    @IBAction func segmentedTap(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.moon.frame.size.width = self.view.frame.size.width
        self.moon.center.x = self.view.center.x
        self.moon.center.y = self.view.frame.height
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.view.frame.maxY*0.1
        self.rocket.frame.size.height = self.view.frame.size.height * 0.12
        
        //segmented

      
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y + self.rocket.bounds.height/2 - 18))
        
        UIView.animate(withDuration: 3.0, delay: 0,options: [.curveLinear] , animations:{
            self.rocket.center.y = self.moon.center.y - self.moon.bounds.height/2
        }
        ) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.rocket.center.y + self.rocket.bounds.height/2))
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = UIColor.blue.cgColor
        myShapeLayer.lineWidth = 2
        myShapeLayer.strokeStart = 0.966
        
        myShapeLayer.path = myPath.cgPath
        view.layer.addSublayer(myShapeLayer)
        
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        myEndAnimation.fromValue = 0.034
        myEndAnimation.toValue = 1.0
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.966
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(myShapeLayer)
        
    }
    
}


