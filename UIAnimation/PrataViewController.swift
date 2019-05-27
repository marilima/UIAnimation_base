//
//  PrataViewController.swift
//  UIAnimation
//
//  Created by Pedro Giuliano Farina on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import Foundation
import UIKit

class PrataController : UIViewController, UITextFieldDelegate{
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    @IBOutlet var lblNome: UILabel!
    @IBOutlet var txtLogin: UITextField!
    @IBOutlet var txtSenha: UITextField!
    @IBOutlet var btnEntrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtLogin.delegate = self
        txtSenha.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseOut] , animations: {
            self.rocket.center.y = self.world.center.y - self.world.frame.size.height/2 - self.rocket.frame.size.height/2 + 20
        }) { finished in
            self.rocket.image = UIImage(named: "rocket2")
            self.moveForm(comingIn:true)
        }
    }
    
    func moveForm(comingIn:Bool){
        moveForm(comingIn: comingIn, completion: {})
    }
    
    func moveForm(comingIn:Bool, completion : @escaping () -> Void){
        let pos = comingIn ? self.view.center.x : self.view.center.x - self.view.bounds.width
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            self.lblNome.center.x = pos
            })
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.txtLogin.center.x = pos
        })
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseOut], animations: {
            self.txtSenha.center.x = pos
        })
        UIView.animate(withDuration: 1, delay: 0.6, options: [.curveEaseOut], animations: {
            self.btnEntrar.center.x = pos + self.txtSenha.frame.width/2 - self.btnEntrar.frame.width/2
        }, completion:{
            finished in
            completion()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblNome.frame.size.width = 120
        
        self.rocket.image = UIImage(named: "rocket")
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = 0
        self.rocket.frame.size.height = self.view.frame.size.height * 0.12
        self.world.frame.size.width = self.view.frame.size.width
        self.world.center.x = self.view.center.x
        self.world.center.y = self.view.frame.height
        
        let bounds = view.bounds.width
        
        self.lblNome.center.x -= bounds
        self.txtLogin.center.x -= bounds
        self.txtSenha.center.x -= bounds
        self.btnEntrar.center.x -= bounds
    }
    
    
    @IBAction func btnTap(_ sender: UIButton) {
        if txtSenha.text == "" || txtLogin.text == ""{
            let oldPosition = rocket.layer.position.y
            self.rocket.image = UIImage(named: "rocket")
            UIView.animate(withDuration: 0.5, delay:0, options:[.curveLinear], animations: {
                self.rocket.layer.position = CGPoint(x: self.view.center.x, y: self.txtSenha.layer.position.y + self.txtSenha.frame.height)
            }) { (finished) in
                self.rocket.layer.position.y = oldPosition
                self.rocket.image = UIImage(named: "rocket2")
            }
        }
        else{
            moveForm(comingIn: false, completion: {
                self.rocket.image = UIImage(named: "rocket")
                        UIView.animate(withDuration: 2, animations:  {
                            self.rocket.center.y -= self.view.bounds.height
                        },
                        completion: { finished in
                            self.performSegue(withIdentifier: "didLogin", sender: self)
                        })
            })
            
        }
    }
}


class DidLoginController:UIViewController{
    
    @IBAction func btnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
