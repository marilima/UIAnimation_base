//
//  OuroViewController.swift
//  UIAnimation
//
//  Created by Pedro Giuliano Farina on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class OuroController:UIViewController{
    private var clicked:Bool = false
    @IBOutlet var card: UIView!
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    @IBAction func tapOccur(_ sender: UITapGestureRecognizer) {
        clicked = !clicked
        UIView.animate(withDuration: 1) {
            if self.clicked{
                self.widthConstraint.constant = self.view.frame.width
                self.heightConstraint.constant = self.view.frame.height
            }
            else{
                self.widthConstraint.constant = 254
                self.heightConstraint.constant = 254
            }
        }
        
        UIView.animate(withDuration: 1, delay:0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            if self.clicked{
                self.topConstraint.constant = 0
                self.leadingConstraint.constant = 0
            }
            else{
                self.topConstraint.constant = 10
                self.leadingConstraint.constant = 80
            }
            self.view.layoutIfNeeded()
        },
        completion: {finished in
        })
    }
}
