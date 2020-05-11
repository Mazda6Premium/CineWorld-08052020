//
//  AccountVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/11/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

enum CaseAccount {
    case user
    case admin
}

class AccountVC: BaseViewController {
    
    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var viewC: UIView!
    @IBOutlet weak var viewD: UIView!
    @IBOutlet weak var viewE: UIView!
    @IBOutlet weak var viewF: UIView!
    
    @IBOutlet weak var lbA: UILabel!
    @IBOutlet weak var lbB: UILabel!
    @IBOutlet weak var lbC: UILabel!
    @IBOutlet weak var lbD: UILabel!
    @IBOutlet weak var lbE: UILabel!
    @IBOutlet weak var lbF: UILabel!
    
    var caseAccount: CaseAccount = .user

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        roleForAccount()
    }
    
    func setupView() {
        roundCorner(views: [viewA, viewB, viewC, viewD, viewE, viewF], radius: ROUND_CORNER_VIEW_POPUP)
//        addBorder(views: [viewA, viewB, viewC, viewD], width: 3, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        addBorder(views: [viewE, viewF], width: 3, color: MAIN_COLOR)
    }
    
    func roleForAccount() {
        switch caseAccount {
        case .user:
            // THÔNG TIN CÁ NHÂN, PHIM YÊU THÍCH, ĐÁNH GIÁ, GÓP Ý, ĐỔI MẬT KHẨU, ĐĂNG XUẤT
            lbA.text = "Thông tin cá nhân"
            lbB.text = "Yêu thích"
            lbC.text = "Đánh giá"
            lbD.text = "Góp ý"
            lbE.text = "Đổi mật khẩu"
            lbF.text = "Đăng xuất"
        case .admin:
            // ĐĂNG PHIM MỚI, QUẢN LÝ THÀNH VIÊN, QUẢN LÝ DANH MỤC, QUẢN LÝ PHIM, QUẢN LÝ DOANH THU, ĐĂNG XUẤT
            lbA.text = "Đăng phim mới"
            lbB.text = "Quản lý thành viên"
            lbC.text = "Quản lý danh mục"
            lbD.text = "Quản lý phim"
            lbE.text = "Quản lý doanh thu"
            lbF.text = "Đăng xuất"
        }
    }
}
