//
//  PrataViewController.swift
//  UIAnimation
//
//  Created by Lucas Fernandez Nicolau on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class PrataViewController: UIViewController, UITextFieldDelegate {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var heading: UILabel!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.delegate = self
        password.delegate = self
        
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        heading.center.x = -view.bounds.width
        username.center.x = -view.bounds.width
        password.center.x = -view.bounds.width
        loginButton.center.x = -view.bounds.width
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = -self.rocket.frame.height
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.35, delay: 0, options: [.curveEaseOut], animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.height / 2
        }, completion: { finished in
            self.rocket.image = #imageLiteral(resourceName: "rocket2")
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut], animations: {
                self.heading.center.x = self.view.center.x
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: {
                self.username.center.x = self.view.center.x
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [.curveEaseInOut], animations: {
                self.password.center.x = self.view.center.x
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseInOut], animations: {
                self.loginButton.center.x = self.view.center.x
            }, completion: nil)
        })
    }

    @IBAction func login() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.heading.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.loginButton.center.x += self.view.bounds.width
        }, completion: { completed in
            
            UIView.animate(withDuration: 2.35, delay: 0, options: [.curveEaseOut], animations: {
                self.rocket.image = #imageLiteral(resourceName: "rocket")
                self.rocket.center.y = -self.rocket.frame.height / 2
            }, completion: { completed in
                self.performSegue(withIdentifier: "loggedIn", sender: self)
            })
            
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
