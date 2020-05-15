//
//  LaunchScreenVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/15/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class LaunchScreenVC: BaseViewController {
    
    @IBOutlet weak var imgFrame: UIImageView!
    @IBOutlet weak var lbLoading: UILabel!
    
    var imgLogo = UIImageView()
    var times = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationLogo()
    }
    
    func setupView() {
        lbLoading.alpha = 0
        lbLoading.text = "Đang tải "
        imgLogo.image = UIImage(named: "logo")
        imgLogo.frame = CGRect(x: 30, y: screenHeight, width: imgFrame.frame.width, height: imgFrame.frame.height)
        view.addSubview(imgLogo)
    }
    
    func animationLogo() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 2, animations: {
            self.imgLogo.frame = self.imgFrame.frame
            self.view.layoutIfNeeded()
        }) { (_) in
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
                self.lbLoading.alpha = 1
                let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.openLogin), userInfo: nil, repeats: true)
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        

    }
    
    @objc func openLogin() {
        if times == 4 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            lbLoading.text! += "."
            times += 1
        }
    }
}
