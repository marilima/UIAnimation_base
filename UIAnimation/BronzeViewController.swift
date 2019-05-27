//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Leonardo Oliveira on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var backgroundSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backgroundSegmentedControlChange(_ sender: UISegmentedControl) {
        
        if backgroundSegmentedControl.selectedSegmentIndex == 0{
            self.view.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.3594709039, blue: 0.4427573681, alpha: 1)
            
        } else if backgroundSegmentedControl.selectedSegmentIndex == 1{
            self.view.backgroundColor = UIColor.black
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // bounds - conteúdo dentro do frame
        // frame - escala e posicionamento
        // center - movimentação na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.view.frame.height
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myPath = UIBezierPath()
        let myShapeLayer = CAShapeLayer()
        
        UIView.animate(withDuration: 4.0, delay: 0, options: [.curveLinear], animations: {
            
            self.rocket.center.y = -(self.rocket.frame.size.height/2)
            self.rocket.layer.zPosition = 100
            
        }, completion: { finished in
            // self.rocket.image = #imageLiteral(resourceName: "rocket2")
        })
        
        myPath.move(to: CGPoint(x: self.rocket.center.x, y: (self.view.frame.height + self.rocket.frame.size.height)))
        myPath.addLine(to: CGPoint(x: self.rocket.center.x, y: -(self.rocket.frame.size.height)))
        
        myShapeLayer.strokeColor = #colorLiteral(red: 0.2549020872, green: 0.2507159207, blue: 0.2587435233, alpha: 0.8967044454)
        myShapeLayer.lineWidth = 10
        
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.8
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 4.2
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        self.view.layer.addSublayer(myShapeLayer)
        
    }
    

}
