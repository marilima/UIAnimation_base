//
//  CustomCard.swift
//  UIAnimation
//
//  Created by Lucas Fernandez Nicolau on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

@IBDesignable
class Card: UIButton {
    var isOpened = false
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setLayout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       super.touchesBegan(touches, with: event)
        
        if isTouchInside {
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if let first = touches.first {
            if !self.point(inside: first.location(in: self), with: event) {
                UIView.animate(withDuration: 0.2) {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func setLayout() {
        self.layer.cornerRadius = self.frame.width / 12
        self.layer.masksToBounds = true
    }
}
