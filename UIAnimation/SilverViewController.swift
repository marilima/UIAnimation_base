//
//  SilverViewController.swift
//  UIAnimation
//
//  Created by Leonardo Oliveira on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class SilverViewController: UIViewController {

    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // bounds - conteúdo dentro do frame
        // frame - escala e posicionamento
        // center - movimentação na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.view.frame.size.height - self.world.frame.height / 2
        self.rocket.frame.size.height = self.view.frame.size.height * 0.30
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        self.loginTextField.center.x = self.loginTextField.frame.width / 2
        self.passwordTextField.center.x = self.passwordTextField.frame.width / 2
        self.signinBtn.center.x = self.signinBtn.frame.width / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseOut], animations: {
            self.loginTextField.center.x = self.view.center.x
            self.passwordTextField.center.x = self.view.center.x
            self.signinBtn.center.x = self.view.center.x
        
        }, completion: { finished in
            // self.rocket.image = #imageLiteral(resourceName: "rocket2")
        })
    }
    
    @IBAction func signinBtnPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveLinear], animations: {
            self.rocket.image = #imageLiteral(resourceName: "rocket")
            self.rocket.center.y = -(self.rocket.frame.size.height/2)
            self.rocket.layer.zPosition = 100
            
        }, completion: { finished in
            self.performSegue(withIdentifier: "silverSegue", sender: self)
        })
        
    }
    
}
