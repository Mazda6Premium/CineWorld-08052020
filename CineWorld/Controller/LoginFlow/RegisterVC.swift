//
//  RegisterVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/9/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class RegisterVC: BaseViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        roundCorner(views: [viewPopup], radius: ROUND_CORNER_VIEW_POPUP)
        roundCorner(views: [btnCancel, btnRegister], radius: ROUND_CORNER_BUTTON)
        roundCorner(views: [imgAvatar], radius: 40)
        addBorder(views: [imgAvatar], width: 1, color: BORDER_IMAGE_COLOR)
    }
    
    @IBAction func tapOnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
    }
    
    
}
