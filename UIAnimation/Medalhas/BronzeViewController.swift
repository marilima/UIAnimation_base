//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Matheus Gois on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    let animateDuration:TimeInterval = 3
    var inicio:CGPoint = CGPoint()
    var final:CGPoint = CGPoint()
    
    @IBAction func segmentation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            sender.tintColor = #colorLiteral(red: 0.2631746531, green: 0.3594709039, blue: 0.4427573681, alpha: 1)
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case 1:
            sender.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.view.backgroundColor = #colorLiteral(red: 0.2631746531, green: 0.3594709039, blue: 0.4427573681, alpha: 1)
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //calls a function when clicked on the world
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        world.addGestureRecognizer(singleTap)
        
    }
    
    //Color Random when you tap in the world
    @objc func tapDetected() {
        self.view.backgroundColor = .random()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.inicio = CGPoint(x: self.rocket.center.x, y: self.rocket.center.y)
        
        self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
        self.final = CGPoint(x: self.rocket.center.x, y: self.rocket.center.y)
        
//        self.rocket.image = UIImage(named: "rocket2")
        //            self.animateFire(self.inicio, self.final)
        
        
        UIView.animate(withDuration: self.animateDuration, delay: 0, options: [.curveLinear], animations: {
            self.rocket.center = self.inicio
            self.inicio.y = self.inicio.y + self.rocket.frame.size.height/2 - 15
            self.final.y = self.final.y + self.rocket.frame.size.height/2
            self.animateFire(self.final, self.inicio)
            //                self.rocket.center.y = self.world.center.y + self.world.frame.size.height/2 + self.rocket.frame.size.height/2
        })
        
        
        
        
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.1
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
    
    
    func animateFire(_ inicio: CGPoint, _ final: CGPoint){
        let path = UIBezierPath()
        path.move(to: inicio)
        path.addLine(to: final)
        
        // create shape layer for that path
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.borderColor = #colorLiteral(red: 0.9398906827, green: 0.6463938355, blue: 0.1757641435, alpha: 1)
        shapeLayer.strokeColor = #colorLiteral(red: 0.9420522451, green: 0.7616958618, blue: 0.1926662326, alpha: 1)
        shapeLayer.lineWidth = 3
        shapeLayer.borderWidth = 2
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 1
        
        let lineShapeBorder = CAShapeLayer()
        lineShapeBorder.strokeColor = #colorLiteral(red: 0.9398906827, green: 0.6463938355, blue: 0.1757641435, alpha: 1)
        lineShapeBorder.lineWidth = 7
        lineShapeBorder.borderWidth = 2
        lineShapeBorder.path = path.cgPath
        lineShapeBorder.strokeStart = 1
        

        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0
        myEndAnimation.toValue = 1
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0
        myStartAnimation.toValue = 0.1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = animateDuration
        
        
        
        lineShapeBorder.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(lineShapeBorder)
        shapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(shapeLayer)
    }

}
