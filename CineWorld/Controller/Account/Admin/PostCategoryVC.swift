//
//  PostCategoryVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/12/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class PostCategoryVC: BaseViewController {
    
    @IBOutlet weak var viewOutside: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tvFilmName: UITextView!
    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var btnPost: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupNavigationBar(title: "Đăng danh mục")
    }
    
    func setupView() {
        roundCorner(views: [viewOutside], radius: ROUND_CORNER_VIEW_POPUP)
        addShadow(views: [viewOutside])
        roundCorner(views: [imgAvatar], radius: 30)
        roundCorner(views: [imgFilm], radius: ROUND_CORNER_IMAGE)
        addBorder(views: [imgAvatar, imgFilm], width: 1, color: BORDER_IMAGE_COLOR)
        roundCorner(views: [btnPost, tvFilmName], radius: ROUND_CORNER_BUTTON)
    }

    @IBAction func tapOnPost(_ sender: Any) {
        if tvFilmName.text != "" {
            showToast(message: "Tên danh mục không được để trống")
            return
        }
        
        let key = databaseReference.childByAutoId().key!
        let category = Category(name: tvFilmName.text!, image: "", id: key)
        databaseReference.child("Category").child(key).setValue(category.asDictionary())
    }
}
