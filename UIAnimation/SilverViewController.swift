//
//  SilverViewController.swift
//  UIAnimation
//
//  Created by Paula Leite on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class SilverViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        
        UIView.animate(withDuration: 0.5) {
            self.name.center.x += self.view.bounds.width
            self.username.center.x += self.view.bounds.width
            self.password.center.x += self.view.bounds.width
        }

        
    }
    
    // Antes de aparecer
    override func viewWillAppear(_ animated: Bool) {
        
        // bounds - conteudo dentro do frame
        // frame - escala e posicionamento
        // center - movimentacao na tela
        
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height * 0.3
        
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        name.center.x -= view.bounds.width
        username.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
    }
    
    @IBAction func login() {
        UIView.animate(withDuration: 4.0, delay: 0, options: [.curveEaseOut], animations: {
        
            // Alteracoes das coisas setadas anteriormente
            self.rocket.image = UIImage(named: "rocket.png")
            self.rocket.center.y = -self.rocket.frame.height
        
        }, completion: { finished in
            self.performSegue(withIdentifier: "loginText", sender: self)
        })
        
        UIView.animate(withDuration: 0.5) {
            self.name.center.x += self.view.bounds.width
            self.username.center.x += self.view.bounds.width
            self.password.center.x += self.view.bounds.width
            self.button.center.x += self.view.bounds.width
        }
        
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
