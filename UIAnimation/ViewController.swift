//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController:

    UIViewController {
    
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet weak var rocket: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // Depois que aparecer
    override func viewDidAppear(_ animated: Bool) {
        
//        let circlePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.width, startAngle: 0, endAngle: .pi*2, clockwise: false)
//
//        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
//
//        animation.duration = 5
//        animation.repeatCount = MAXFLOAT
//        animation.path = circlePath.cgPath
//
//        self.rocket.layer.add(animation, forKey: nil)
        
        // options: .repeat, .autoreverse
        // options: .curveEasyIn, .curveEaseOut, .curveEaseInOut
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveEaseOut], animations: {

            // Alteracoes das coisas setadas anteriormente
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2
            // self.rocket.transform = self.rocket.transform.rotated(by: CGFloat(Double.pi))

        }, completion: { finished in
            self.rocket.image = UIImage(named: "rocket2.png")
        })
    }
    
    // Antes de aparecer
    override func viewWillAppear(_ animated: Bool) {
    
        // bounds - conteudo dentro do frame
        // frame - escala e posicionamento
        // center - movimentacao na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.3
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        
        
    }


}

