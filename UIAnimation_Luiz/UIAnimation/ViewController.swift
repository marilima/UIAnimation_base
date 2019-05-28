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
        
        let circlePath = UIBezierPath(
            arcCenter: self.world.center,
            radius: self.world.frame.height,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true)
        
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position)) //***É uma animacao do tipo position***
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath //***isso relaciona a animacao***
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(circleLayer)
        
        
        rocket.layer.add(animation, forKey: nil)
    }
    
    
//
//        UIView.animate(withDuration: 2, delay: 1, options: [ .curveEaseIn], animations:{
//            self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
//            //***curve EaseIn acelera no começo e final é velocidade a mesma***
//            //***curve EaseOut acelera no final e no começo a velocidade é a mesma***
//            //***cuve EaseInOut  acelera no começo e acelera no final e no meio a velocidade é a mesma***
//
//            self.rocket.transform = self.rocket.transform.rotated(by: .pi)
//
//
//
//        }, completion: {finished in
//            self.rocket.image = UIImage(named: "rocket2.png")
//            self.outraAnimacao()
//              //***Funcao de outra animacao sendo chamada
//        })
//    }
//
//    func outraAnimacao(){
//      //***Funcao de outra animacao para colocar depois do completion***
//
//        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseIn], animations:{
//            self.rocket.center.x = self.view.frame.width
//
//
//
//        } )
//    }

        
        
    
//            //self.rocket.transform = self.rocket.transform.scaledBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        
        
        
        
        
    override func viewWillAppear(_ animated: Bool) {
        
        //chamada para arrumar o conteudo antes de aparecer na tela
        //tamanho e posicao do planeta
        self.world.frame.size.width = self.view.frame.width//definindo o tamanho do mundo
        self.world.center.y = self.view.frame.height//define a posicao y que o mundo vai aparecer
        
        //tamanho e posicao do foguete
        self.rocket.frame.size.height = self.view.frame.height * 0.15
        self.rocket.center.x = self.view.center.x//centraliza o foguete
        self.rocket.center.y = self.rocket.frame.height/2
        
    }


}


