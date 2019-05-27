//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Paula Leite on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class BronzeViewController: UIViewController {


    @IBOutlet weak var rocketBronze: UIImageView!
    @IBOutlet weak var worldBronze: UIImageView!
    
    let backgroudColors: [UIColor] = [#colorLiteral(red: 0.2631746531, green: 0.3594709039, blue: 0.4427573681, alpha: 1), #colorLiteral(red: 0.187418063, green: 0.2592587816, blue: 0.319437258, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Depois que aparecer
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveEaseOut], animations: {
            
            // Alteracoes das coisas setadas anteriormente
            self.rocketBronze.image = UIImage(named: "rocket.png")
            self.rocketBronze.center.y = -self.rocketBronze.frame.height
            self.rocketBronze.layer.zPosition  = 100
            
        })
        
        let myPath = UIBezierPath()
        //myPath.move(to: CGPoint(x: rocketBronze.center.y + rocketBronze.frame.height/2, y: rocketBronze.center.x))
        myPath.move(to: CGPoint(x: self.view.center.x, y: worldBronze.center.y))
        myPath.addLine(to: CGPoint(x: rocketBronze.center.x, y: worldBronze.center.y - rocketBronze.frame.height/2 - 900))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myShapeLayer.lineWidth = 2
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
        animationGroup.duration = 3.5
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        self.view.layer.addSublayer(myShapeLayer)
        
    }
    
    // Antes de aparecer
    override func viewWillAppear(_ animated: Bool) {
        
        // bounds - conteudo dentro do frame
        // frame - escala e posicionamento
        // center - movimentacao na tela
        
        self.rocketBronze.center.x = self.view.center.x
        self.rocketBronze.frame.size.height = self.view.frame.size.height * 0.3
        
        self.worldBronze.frame.size.width = self.view.frame.size.width
        self.worldBronze.center.x = self.view.center.x
        self.worldBronze.center.y = self.view.frame.height
        
        
        
    }
    
    
    @IBAction func segmentedColor(_ sender: UISegmentedControl) {
        self.view.backgroundColor = backgroudColors[sender.selectedSegmentIndex]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
