//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //puxei primeiro as duas imagens que eram o rocket e o world.
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var world: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//chamada para aparecer as coisas depois que carregar a  tela.
    override func viewDidAppear(_ animated: Bool) {
        
        
////aqui voce escreve o que é a sua animação.
//// em options existe o repetir, autoreverse que é pra ele continuar fazer a animacao, o ease ajuda a dar suavidade, deixar mais natural a animação.
//
//        UIView.animate(withDuration: 2.0, delay: 2, options: [], animations: {
//            self.rocket.center.y = self.view.frame.height - self.world.frame.height/2
//
////transform serve para voce rotacionar a imagem (faz vezez pi que da 180 graus e assim ele da meia volta).
//            self.rocket.transform = self.rocket.transform.rotated(by: .pi/2)
//
////para que voce aumente sua imagem voce v=coloca essa linha de codigo.
//            self.rocket.transform = self.rocket.transform.scaledBy(x: 2, y: 2)
//
////quando acabar o tempo da animacao voce entra nesse bloco de dados.
//        }, completion: { finished in
////            self.rocket.image = UIImage(named: "rocket2.png" )
//           self.outraAnimacao ()
//
//        })
        //para que o foguete fique orbitando em volta do mundo
        let circlePath =  UIBezierPath(arcCenter: self.world.center,radius: self.world.frame.height, startAngle: 0,
                                       endAngle: .pi*2,
                                       clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 2
        animation.repeatCount = MAXFLOAT
        animation.path = circlePath.cgPath
        rocket.layer.add(animation, forKey: nil)
         self.rocket.transform = self.rocket.transform.rotated(by: .pi/2)
        
        func outraAnimacao() {
            UIView.animate(withDuration: 1.5,  animations: {
                self.rocket.center.x = self.view.frame.width*2
               
            })
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//chamada para arrumar o conteúdo antes de aparecer na tela (o mundo estar la em baixo e o foguete tambem), ou seja irá ficar posicionado antes de aparecer na tela.
        
//tamanho e posição do mundo.
        self.world.frame.size.width = self.view.frame.width
        self.world.center.y = self.view.frame.height
        
//tamanho e posição do foguete.
        self.rocket.frame.size.height = self.view.frame.height * 0.15
        self.rocket.center.x = self.view.center.x
        self.rocket.center.y = self.rocket.frame.height/2
        
    }

}

