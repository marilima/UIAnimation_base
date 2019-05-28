//
//  ViewControllerBronze.swift
//  UIAnimation
//
//  Created by Fabrício Guilhermo on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//
import UIKit

class ViewControllerBronze: UIViewController
{
    
    //  segmented control, para trocar background
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func indexChanged(_ sender: Any)
    {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.view.backgroundColor = #colorLiteral(red: 0.2625385225, green: 0.3625041246, blue: 0.4428519905, alpha: 1)
        case 1:
            self.view.backgroundColor = #colorLiteral(red: 0.09890385717, green: 0.1375659108, blue: 0.1691181362, alpha: 1)
        default:
            break
        }
    }
    
    
    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    override func viewDidLoad()
    {
        print("viewDidLoad")
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        print("viewDidAppear")
        UIView.animate(withDuration: 3, delay: 0, options: [.curveEaseInOut], animations:
            {
                self.rocket.center.y = -self.view.frame.height + self.view.frame.height - self.rocket.frame.height/2
            })
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        print("viewWillAppear")
        
        // chamada para arrumar o conteúdo antes de aparecer na tela
        // .frame = tamanho
        
        // largura do planeta = largura da view
        self.world.frame.size.width = self.view.frame.width
        
        // posiciona o planeta na parte de baixo
        self.world.center.y = self.view.frame.height
        
        // altura do foguete = 15% da altura da view
        self.rocket.frame.size.height = self.view.frame.height * 0.35
        
        // centralizar no eixo x
        self.rocket.center.x = self.view.center.x
        
        // posiciona o foguete na parte de baixo da view
        self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
        
        self.view.sendSubviewToBack(rocket)
        self.view.sendSubviewToBack(world)
        
        let myPath = UIBezierPath()
        myPath.move(to: CGPoint(x: self.view.center.x, y: self.view.frame.height + self.rocket.frame.height/2))
        myPath.addLine(to: CGPoint(x: self.view.center.x, y: -self.view.frame.height + self.view.frame.height - self.rocket.frame.height))
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = #colorLiteral(red: 0.9439728856, green: 0.6075943708, blue: 0.1707503796, alpha: 1)
        myShapeLayer.lineWidth = 6
        
        myShapeLayer.path = myPath.cgPath
        view.layer.addSublayer(myShapeLayer)
        myShapeLayer.zPosition = -1
        myShapeLayer.strokeStart = 0.8
        
        let myAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myAnimation.fromValue = 0
        myAnimation.toValue = 1
        myAnimation.duration = 1
        
        myShapeLayer.add(myAnimation, forKey: "drawLine")
        
        //Criamos a animação que desenha
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        //E em seguida, a que apaga
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = 3
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        view.layer.addSublayer(myShapeLayer)
    }
}
