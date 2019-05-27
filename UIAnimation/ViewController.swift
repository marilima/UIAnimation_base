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
//        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
//
//            // curveEaseIn comeca mais rapido e curveEaseInOut acelera no comeco e fica devagar no final
//            //autoreverse comeca e para no final
//
//            self.rocket.center.y =  self.view.frame.height - self.world.frame.height/2
////            self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double = .pi/2))
//
//        }, completion: { finished in
//           self.rocket.image = UIImage(named: "rocket2.png")
//        })
        let circlePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.height, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 5.0
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        rocket.layer.add(animation, forKey: nil)
        
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(circleLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //chamada para arrumar o conteudo antes de aparecer na tela
        
        //bounds - conteudo dentro do frame
        //frame - escala e posicionamento
        //center - movimentacao na tela
        
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.height * 0.15
        self.rocket.center.y = self.rocket.frame.height/2
        
        self.world.frame.size.width  = self.view.frame.size.width
//        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
}

