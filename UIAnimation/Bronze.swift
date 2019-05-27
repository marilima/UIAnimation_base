//
//  Bronze.swift
//  UIAnimation
//
//  Created by Nathalia Melare on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class Bronze: UIViewController {
    
    @IBAction func mudarCor(_ sender: Any) {
        switch cor.selectedSegmentIndex {
        case 0:
            view.backgroundColor = #colorLiteral(red: 0.2632744312, green: 0.3619142771, blue: 0.4428775012, alpha: 1)
        case 1:
            view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        default:
            break
        }
    }
    
    @IBOutlet weak var cor: UISegmentedControl!
    @IBOutlet weak var moon: UIImageView!
    
    @IBOutlet weak var rocket: UIImageView!
    
    var myPath = UIBezierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
     override func viewDidAppear(_ animated: Bool) {
      

        
                UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
                    self.rocket.center.y =  40
  }, completion: { finished in
                   self.rocket.image = UIImage(named: "rocket.png")
                })
}
    
    override func viewWillAppear(_ animated: Bool) {
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.view.frame.height/2 + self.moon.frame.height/2
        
        self.moon.frame.size.width  = self.view.frame.size.width
        self.moon.center.y = self.view.frame.height
        
        myPath.move(to: CGPoint(x: rocket.center.x, y: rocket.center.y + rocket.frame.height/2+20))
        myPath.addLine(to: CGPoint(x: rocket.center.x, y: 40 + rocket.frame.height/2))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = UIColor.orange.cgColor
        myShapeLayer.lineWidth = 5
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.8
        
        
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 2
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(myShapeLayer)
        
    }
}
