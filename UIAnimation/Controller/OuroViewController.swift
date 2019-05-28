//
//  OuroViewController.swift
//  UIAnimation
//
//  Created by Lucas Fernandez Nicolau on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class OuroViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var myCard: Card!
    
    var originalFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        guard let window = appDelegate.window else { return }
        
        self.myCard.center = window.center
        
        originalFrame = myCard.frame
    }
    
    @IBAction func cardTouched() {
        
        if !self.myCard.isOpened {
            openCard()
        } else {
            closeCard()
        }
    }
    
    func openCard() {
        // Move Up a little bit
        UIView.animate(withDuration: 0.15) {
            self.myCard.center.y -= 30
        }
        
        // Bounce Up
        UIView.animate(withDuration: 0.35, delay: 0.15, options: [.curveEaseIn], animations: {
            
            self.changeSize(withInsetW: 20, andInsetH: 20)
            
        }) { completed in
            
            // Bounce Down
            UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn], animations: {
                
                self.tabBarController?.tabBar.isHidden = true
                self.changeSize(withInsetW: -5, andInsetH: -5)
                
            }, completion: { completed in
                
                // Fit Size
                UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn], animations: {
                    
                    self.changeSize()
                    
                }, completion: { completed in
                    
                    self.myCard.isOpened = true
                })
            })
        }
    }
    
    func closeCard() {
        // Move Down a little bit
        UIView.animate(withDuration: 0.15) {
            self.myCard.center.y += 30
            self.tabBarController?.tabBar.isHidden = false
        }
        
        // Bounce Down
        UIView.animate(withDuration: 0.35, delay: 0.15, options: [.curveEaseIn], animations: {
            
            self.changeSize(using: self.originalFrame, withInsetW: -20, andInsetH: -20)
            
        }) { completed in
            
            // Bounce Up
            UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn], animations: {
                
                self.changeSize(using: self.originalFrame, withInsetW: 5, andInsetH: 5)
                
            }, completion: { completed in
                
                // Fit Size
                UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseIn], animations: {
                    
                    self.changeSize(using: self.originalFrame)
                    
                }, completion: { completed in
                    
                    self.myCard.isOpened = false
                })
            })
        }
    }
    
    func changeSize(using frame: CGRect = CGRect.zero, withInsetW insetW: CGFloat = 0, andInsetH insetH: CGFloat = 0) {
        
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        guard let window = appDelegate.window else { return }
        
        if (frame == CGRect.zero) {
            self.myCard.frame.size.width = window.frame.width + insetW
            self.myCard.frame.size.height = window.frame.height + insetH
            self.myCard.center = window.center
        } else {
            self.myCard.frame.size.width = frame.width + insetW
            self.myCard.frame.size.height = frame.height + insetH
            self.myCard.center = window.center
        }
    }
}
