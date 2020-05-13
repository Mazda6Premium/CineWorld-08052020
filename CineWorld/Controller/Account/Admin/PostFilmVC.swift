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
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtVideoName: UITextField!
    @IBOutlet weak var txtLinkVideo: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var txtStar: UITextField!
    @IBOutlet weak var txtComment: UITextField!
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var txtIndex: UITextField!
    @IBOutlet weak var btnPost: UIButton!
    
    var arrayCategory = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        getCategory()
    }
    
    func setupView() {
        setupNavigationBar(title: "Đăng phim mới")
        roundCorner(views: [viewPopup], radius: ROUND_CORNER_VIEW_POPUP)
        roundCorner(views: [txtCategory, txtType, txtVideoName, txtLinkVideo, tvDescription, txtStar, txtComment, txtView, txtIndex, btnPost], radius: ROUND_CORNER_BUTTON)
        addShadow(views: [viewPopup])
        
        txtCategory.delegate = self
    }
    
    func getCategory() {
        showLoading()
        databaseReference.child("Category").observe(.childAdded) { (snapshot) in
            databaseReference.child("Category").child(snapshot.key).observe(.value) { (snapshot1) in
                if let dict = snapshot1.value as? [String: Any] {
                    let category = Category(fromDict: dict)
                    self.arrayCategory.append(category)
                    DispatchQueue.main.async {
                        self.hideLoading()
                    }
                }
            }
        }
    }
}

extension PostFilmVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        ActionSheetStringPicker(title: "Chọn danh mục", rows: self.arrayCategory, initialSelection: 0, doneBlock: { (picker, index, value) in
            if let data = value as? String {
                self.txtCategory.text = data
            }
        }, cancel: nil, origin: txtCategory).show()
        return false
    }
}
