//
//  CircularViewController.swift
//  UIAnimation
//
//  Created by Rayane Xavier on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class CircularViewController: UIViewController {
    
    @IBOutlet weak var Foguetinho: UIImageView!
    
    @IBOutlet weak var Lua: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let circlePath = UIBezierPath(arcCenter: self.Lua.center, radius: self.Lua.frame.height, startAngle: 0, endAngle: .pi*2, clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 5.0
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        
        Foguetinho.layer.add(animation,forKey: nil)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(circleLayer)
    }
    
    func outraAnimacao(){
        UIView.animate(withDuration: 2.0, animations: {
            self.Foguetinho.center.x = self.view.frame.width
            self.Foguetinho.transform = self.Foguetinho.transform.rotated(by: 1.0 * .pi)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // chamada para arrumar o conteudo antes de aparecer na tela
        self.Lua.frame.size.width = self.view.frame.width
        //tamanho do planeta
        self.Lua.center.y = self.view.frame.height
        // posicao do planeta
        
        
        self.Foguetinho.frame.size.height = self.view.frame.height * 0.15
        // tamanho do foguete
        self.Foguetinho.center.x = self.view.center.x
        // centralizando o foguete no centro da view
        self.Foguetinho.center.y = self.Foguetinho.frame.height/1.25
        // centralizar o centro do y do foguete no 1.25 da altura dele
    }
    
}

