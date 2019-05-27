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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // bounds - conteúdo dentro do frame
        // frame - escala e posicionamento
        // center - movimentação na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveEaseOut], animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.height / 2
        }, completion: { finished in
            self.rocket.image = #imageLiteral(resourceName: "rocket2")
        })
        
//        let circlePath = UIBezierPath(arcCenter: self.world.center, radius: self.world.frame.width, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//        
//        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
//        
//        animation.duration = 3.5
//        animation.repeatCount = MAXFLOAT
//        animation.path = circlePath.cgPath
//        
//        self.rocket.layer.add(animation, forKey: nil)
    }
}

