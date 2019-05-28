//
//  BronzeController.swift
//  UIAnimation
//
//  Created by Luiz Henrique Monteiro de Carvalho on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class BronzeViewController: UIViewController {
    
    
    
    @IBOutlet weak var world: UIImageView!
    
    @IBOutlet weak var rocket: UIImageView!
    
    
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    
override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
    @IBAction func SegmentActionControl(_ sender: Any) {
        
        switch SegmentControl.selectedSegmentIndex {
        case 0:
            view.backgroundColor = UIColor.blue
        case 1:
            view.backgroundColor = UIColor.black
        default:
            break
        }
        
    }
    
    

override func viewDidAppear(_ animated: Bool) {
    let fumacaLayer = CAShapeLayer()
    UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations:{
        self.rocket.center.y = self.rocket.frame.height/2
        //***curve EaseIn acelera no começo e final é velocidade a mesma***
        //***curve EaseOut acelera no final e no começo a velocidade é a mesma***
        //***cuve EaseInOut  acelera no começo e acelera no final e no meio a velocidade é a mesma***
        
        
        
        
        
    }, completion: {finished in
        fumacaLayer.removeFromSuperlayer()
        //    self.rocket.image = UIImage(named: "rocket2.png")
        
        //***Funcao de outra animacao sendo chamada
    })
    
    let fumacaPath = UIBezierPath()
    fumacaPath.move(to: CGPoint(x: self.view.center.x, y: self.view.frame.height - self.world.frame.height/2))
    fumacaPath.addLine(to: CGPoint(x: self.view.center.x, y: self.rocket.frame.height/2))
    
    
    fumacaLayer.strokeColor = UIColor.white.cgColor
    fumacaLayer.lineWidth = 2
    fumacaLayer.strokeStart = 0.7
    fumacaLayer.zPosition = -1
    
    fumacaLayer.path = fumacaPath.cgPath
    self.view.layer.addSublayer(fumacaLayer)
    
    let fumacaAnimation = CABasicAnimation(keyPath: "strokeEnd")
    fumacaAnimation.fromValue = 0.1
    fumacaAnimation.toValue = 1
    
    let fumacaAnimation2 = CABasicAnimation(keyPath: "strokeStart")
    fumacaAnimation2.fromValue = 0
    fumacaAnimation2.toValue = 0.65
    
    let fumacaGroup = CAAnimationGroup()
    fumacaGroup.animations = [fumacaAnimation,fumacaAnimation2]
    fumacaGroup.duration = 2
    
    fumacaLayer.add(fumacaGroup, forKey: "drawLine")



}




    
    
override func viewWillAppear(_ animated: Bool) {
        
        //chamada para arrumar o conteudo antes de aparecer na tela
        //tamanho e posicao do planeta
        self.world.frame.size.width = self.view.frame.width//definindo o tamanho do mundo
        self.world.center.y = self.view.frame.height//define a posicao y que o mundo vai aparecer
    
    

        //tamanho e posicao do foguete
        self.rocket.frame.size.height = self.view.frame.height * 0.15
    
        self.rocket.center.x = self.view.center.x//centraliza o foguete
    
        self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
        
    }
    
    
    
    
}

