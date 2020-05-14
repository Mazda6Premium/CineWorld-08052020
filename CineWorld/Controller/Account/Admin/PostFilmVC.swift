//
//  PostFilmVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/12/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class PostFilmVC: BaseViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtVideoName: UITextField!
    @IBOutlet weak var txtLinkVideo: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var txtStar: UITextField!
    @IBOutlet weak var txtComment: UITextField!
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var txtIndex: UITextField!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    var arrayCategory = [Category]()
    var categoryName = ["Top New", "Top Hot", "Top View", "Top Rating"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        getCategory()
    }
    
    func setupView() {
        setupNavigationBar(title: "Đăng phim mới")
        roundCorner(views: [viewPopup], radius: ROUND_CORNER_VIEW_POPUP)
        roundCorner(views: [txtCategory, txtVideoName, txtLinkVideo, tvDescription, txtStar, txtComment, txtView, txtIndex, btnPost], radius: ROUND_CORNER_BUTTON)
        addShadow(views: [viewPopup])
        
        roundCorner(views: [imgFilm], radius: ROUND_CORNER_IMAGE)
        roundCorner(views: [imgAvatar], radius: 30)
        addBorder(views: [imgAvatar, imgFilm], width: 1, color: BORDER_IMAGE_COLOR)
        
        txtCategory.delegate = self
    }
    
    func getCategory() {
        showLoading()
        databaseReference.child("Category").observe(.childAdded) { (snapshot) in
            databaseReference.child("Category").child(snapshot.key).observe(.value) { (snapshot1) in
                if let dict = snapshot1.value as? [String: Any] {
                    let category = Category(fromDict: dict)
                    self.arrayCategory.append(category)
                    self.categoryName.append(category.name)
                    DispatchQueue.main.async {
                        self.hideLoading()
                    }
                }
            }
        }
    }
    
    @IBAction func tapOnPostFilm(_ sender: Any) {
        self.view.endEditing(true)
        showLoading()
        if txtCategory.text == "" || txtVideoName.text == "" || txtLinkVideo.text == "" || tvDescription.text == "" || txtStar.text == "" || txtComment.text == "" || txtView.text == "" || txtIndex.text == "" {
            showToast(message: "Cần nhập đầy đủ thông tin.")
            hideLoading()
        } else {
            let key = databaseReference.childByAutoId().key!
            let film = Film(name: txtVideoName.text!, id: key, index: Int(txtIndex.text!)!, noComment: Int(txtComment.text!)!, noView: Int(txtView.text!)!, noStar: Double(txtStar.text!)!, description: tvDescription.text, link: txtLinkVideo.text!, category: txtCategory.text!)
            databaseReference.child("Film").child(txtCategory.text!).child(key).setValue(film.asDictionary())
            
            showToast(message: "Đăng film thành công")
            hideLoading()
            let _ = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(clearData), userInfo: nil, repeats: false)
        }
    }
    
    @objc func clearData() {
        txtCategory.text = ""
        txtVideoName.text = ""
        txtLinkVideo.text = ""
        tvDescription.text = ""
        txtStar.text = ""
        txtComment.text = ""
        txtView.text = ""
        txtIndex.text = ""
    }
}

extension PostFilmVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtCategory:
            ActionSheetStringPicker(title: "Chọn danh mục", rows: self.categoryName, initialSelection: 0, doneBlock: { (picker, index, value) in
                if let data = value as? String {
                    self.txtCategory.text = data
                }
            }, cancel: nil, origin: txtCategory).show()
            return false
            
        default:
            return true
        }

    }
}
