//
//  Bronze.swift
//  UIAnimation
//
//  Created by Rayane Xavier on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class BronzeViewController: UIViewController {
    @IBOutlet weak var Foguetinho: UIImageView!
    
    @IBOutlet weak var Lua: UIImageView!
    
    @IBAction func SegmentoAction(_ sender: Any) {
        if segmentoOutlet.selectedSegmentIndex == 0 {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            segmentoOutlet.tintColor = .black
        
        }
        else{
            view.backgroundColor = #colorLiteral(red: 0.0206782259, green: 0, blue: 0.05182193965, alpha: 1)
            segmentoOutlet.tintColor = .white
        }

    }
    
    @IBOutlet weak var segmentoOutlet: UISegmentedControl!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let myFoguetinho = UIBezierPath()
        myFoguetinho.move(to: CGPoint(x: self.Foguetinho.center.x, y: self.view.frame.height - self.Lua.frame.height/4))
        myFoguetinho.addLine(to: CGPoint(x: self.view.frame.width/2, y: self.Foguetinho.frame.height/1.25))
        
        let mylinhadoFoguetinho = CAShapeLayer()
        mylinhadoFoguetinho.strokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        mylinhadoFoguetinho.lineWidth = 2
        mylinhadoFoguetinho.path = myFoguetinho.cgPath
        mylinhadoFoguetinho.strokeStart = 1
        mylinhadoFoguetinho.zPosition = -1
        view.layer.addSublayer(mylinhadoFoguetinho)
        
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
        
        
        mylinhadoFoguetinho.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(mylinhadoFoguetinho)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
              self.Foguetinho.center.y = self.Foguetinho.frame.height/1.25
            
            
        }, completion: {finished in
            

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
        self.Foguetinho.center.y = self.view.frame.height - self.Lua.frame.height/1.7
        // centralizar o centro do y do foguete no 1.25 da altura dele
    }
    
}
