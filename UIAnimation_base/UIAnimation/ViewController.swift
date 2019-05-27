//
//  ViewController.swift
//  UIAnimation_base
//
//  Created by Pedro Cacique on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moon: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rocket.center.x = self.view.center.x
        self.rocket.frame.size.height = self.view.frame.size.height*(-0.5)
        self.moon.frame.size.width = self.view.frame.size.width
        self.moon.center.x = self.view.center.x
        self.moon.center.y = self.view.frame.height
        
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, delay: 0, animations:{
                self.rocket.center.y = self.moon.center.y + self.moon.frame.size.height/2.7 - self.rocket.frame.size.height
        }
        ) { (finished) in
            self.rocket.image = UIImage(named: "rocket2")
        }
        
        
    }

}

