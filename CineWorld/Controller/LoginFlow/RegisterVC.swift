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
    
    var imageAvatar : UIImage?
    
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
        addBorder(views: [imgAvatar], width: 1.5, color: BORDER_IMAGE_COLOR)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imgAvatar.isUserInteractionEnabled = true
        imgAvatar.addGestureRecognizer(tapGes)
    }
    
    @IBAction func tapOnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
    }
    
    @objc func chooseImage() {
        let photoLibraryAction = UIAlertAction(title: NSLocalizedString("Thư viện Ảnh", comment: ""), style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let takePhotoAction = UIAlertAction(title: NSLocalizedString("Chụp ảnh", comment: ""), style: .default, handler: { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera;
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Huỷ", comment: ""), style: .cancel, handler: { _ in
        })
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true) { () -> Void in
        }
    }
}

extension RegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageAvatar = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgAvatar.image = imageAvatar
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
