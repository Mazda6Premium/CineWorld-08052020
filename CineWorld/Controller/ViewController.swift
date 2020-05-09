//
//  ViewController.swift
//  CineWorld
//
//  Created by Trung iOS on 5/8/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnForgetPassword(_ sender: Any) {
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        let vc = RegisterVC(nibName: "RegisterVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}

