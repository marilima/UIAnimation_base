//
//  BronzeViewController.swift
//  UIAnimation
//
//  Created by Lucas Fernandez Nicolau on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class BronzeViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    let backgroundColors = [#colorLiteral(red: 0.2039215686, green: 0.2862745098, blue: 0.368627451, alpha: 1), #colorLiteral(red: 0.5333333333, green: 0.7529411765, blue: 0.968627451, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.world.center.y - self.world.frame.height / 2
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        self.rocket.layer.zPosition = 1000
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveLinear], animations: {
            self.rocket.image = #imageLiteral(resourceName: "rocket")
            self.rocket.center.y = -self.rocket.frame.height
        })
        
        delay(1.5) {
            self.createSegmentedAnimation(from: CGPoint(x: self.view.center.x, y: self.view.center.y), to: CGPoint(x: self.view.center.x, y: -100), withDuration: 5.0)
        }
        
        delay(2.0) {
            self.createSegmentedAnimation(from: CGPoint(x: self.view.center.x - 40, y: self.view.center.y), to: CGPoint(x: self.view.center.x - 40, y: -100), withDuration: 3.0)
            
            self.createSegmentedAnimation(from: CGPoint(x: self.view.center.x + 40, y: self.view.center.y), to: CGPoint(x: self.view.center.x + 40, y: -100), withDuration: 3.0)
        }
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        self.view.backgroundColor = backgroundColors[sender.selectedSegmentIndex]
    }
    
    func createSegmentedAnimation(from start: CGPoint, to end: CGPoint, withDuration duration: TimeInterval) {
        let myPath = UIBezierPath()
        myPath.move(to: start)
        myPath.addLine(to: end)
        
        let myShapeLayer = CAShapeLayer()
        myShapeLayer.strokeColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        myShapeLayer.lineWidth = 2
        myShapeLayer.path = myPath.cgPath
        myShapeLayer.strokeStart = 0.8
        
        // Animacão para desenhar a linha
        let myEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        myEndAnimation.fromValue = 0.2
        myEndAnimation.toValue = 1.0
        
        // Animação para apagar a linha
        let myStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        myStartAnimation.fromValue = 0.0
        myStartAnimation.toValue = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [myStartAnimation, myEndAnimation]
        animationGroup.duration = duration
        
        myShapeLayer.add(animationGroup, forKey: "drawLine")
        self.view.layer.addSublayer(myShapeLayer)
    }
}
