//
//  LoggedInViewController.swift
//  UIAnimation
//
//  Created by Lucas Fernandez Nicolau on 27/05/19.
//  Copyright © 2019 Pedro Cacique. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
