
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet var myView: UIView!
    
    
    let myPath = UIBezierPath()
    let myShapeLayer = CAShapeLayer()
    let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    let animationGroup = CAAnimationGroup()

    @IBAction func ChangeBackground(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myView.backgroundColor = #colorLiteral(red: 0.001683385228, green: 0.1258323193, blue: 0.3161295652, alpha: 1)
        } else {
            myView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    func firemove (){
//        myShapeLayer.strokeColor = UIColor.red.cgColor
//        myShapeLayer.lineWidth = 6
//        myShapeLayer.path = myPath.cgPath
//        myShapeLayer.strokeStart = 0.8
//
//
//        myAnimation.fromValue = 0
//        myAnimation.toValue = 1
//        myAnimation.duration = 3
//        myShapeLayer.add(myAnimation, forKey: "drawLine")
//
//
//        animationGroup.animations = [myStartAnimation, myEndAnimation]
//        animationGroup.duration = 2
//
    //        myShapeLayer.add(animationGroup, forKey: "drawLine") }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //        [.repeat,.autoreverse,.curveEaseIn]
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: self.rocket.frame.size.height + self.rocket.frame.height*3))
        
        
        UIView.animate(withDuration: 7, delay: 0, options: [.curveLinear] , animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
            //            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))   rotates the rocket
            
        }) { (fineshed) in
            self.rocket.image = UIImage(named: "rocket2")
            self.myShapeLayer.removeFromSuperlayer()
        }
        
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: self.world.center.y - self.rocket.frame.height/4))
        
        myShapeLayer.strokeColor = UIColor.red.cgColor
        myShapeLayer.lineWidth = 6
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.4
        
        myView.layer.addSublayer(myShapeLayer)
        
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 10
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")

        
        //ROTACAO
        //        let ciclePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.width/2, startAngle: 0, endAngle: .pi*2, clockwise: true)
        //
        //        let animate = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        //
        //        animate.duration = 10
        //        animate.repeatCount = MAXFLOAT
        //        animate.path = ciclePath.cgPath
        //
        //        self.rocket.layer.add(animate, forKey: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
    
}


