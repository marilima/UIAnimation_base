//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
  
    
    
    override func viewDidAppear(_ animated: Bool) {
//        [.repeat,.autoreverse,.curveEaseIn]
        UIView.animate(withDuration: 3, delay: 0, options: [] , animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2
//            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))   rotates the rocket
            
        }) { (fineshed) in
            self.rocket.image = UIImage(named: "rocket2")
        }
        
        
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


