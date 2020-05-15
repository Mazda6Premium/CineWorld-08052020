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

struct Account {
    var name = ""
    var image = ""
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
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
    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var imgD: UIImageView!
    @IBOutlet weak var imgE: UIImageView!
    @IBOutlet weak var imgF: UIImageView!
    
    var caseAccount: CaseAccount = .admin
    var arrayAccount = [Account]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        roleForAccount()
    }
    
    func setupView() {
        let views: [UIView] = [viewA, viewB, viewC, viewD, viewE, viewF]
        roundCorner(views: views, radius: ROUND_CORNER_VIEW_POPUP)
        
        let tapGes1 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewA))
        viewA.addGestureRecognizer(tapGes1)
        
        let tapGes2 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewB))
        viewB.addGestureRecognizer(tapGes2)
        
        let tapGes3 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewC))
        viewC.addGestureRecognizer(tapGes3)
        
        let tapGes4 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewD))
        viewD.addGestureRecognizer(tapGes4)
        
        let tapGes5 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewE))
        viewE.addGestureRecognizer(tapGes5)
        
        let tapGes6 = UITapGestureRecognizer(target: self, action: #selector(tapOnViewF))
        viewF.addGestureRecognizer(tapGes6)
    }
    
    func roleForAccount() {
        switch caseAccount {
        case .user:
            // THÔNG TIN CÁ NHÂN, PHIM YÊU THÍCH, ĐÁNH GIÁ, GÓP Ý, ĐỔI MẬT KHẨU, ĐĂNG XUẤT
            arrayAccount = [Account(name: "Thông tin cá nhân", image: "profile"),
                            Account(name: "Yêu thích", image: "favorite"),
                            Account(name: "Đánh giá", image: "rating"),
                            Account(name: "Góp ý", image: "mail"),
                            Account(name: "Đổi mật khẩu", image: "password"),
                            Account(name: "Đăng xuất", image: "logout")]
            if arrayAccount.count > 5 {
                lbA.text = arrayAccount[0].name
                lbB.text = arrayAccount[1].name
                lbC.text = arrayAccount[2].name
                lbD.text = arrayAccount[3].name
                lbE.text = arrayAccount[4].name
                lbF.text = arrayAccount[5].name
                
                imgA.image = UIImage(named: arrayAccount[0].image)
                imgB.image = UIImage(named: arrayAccount[1].image)
                imgC.image = UIImage(named: arrayAccount[2].image)
                imgD.image = UIImage(named: arrayAccount[3].image)
                imgE.image = UIImage(named: arrayAccount[4].image)
                imgF.image = UIImage(named: arrayAccount[5].image)
            }

        case .admin:
            // ĐĂNG DANH MỤC MỚI, ĐĂNG PHIM MỚI, QUẢN LÝ THÀNH VIÊN, QUẢN LÝ DANH MỤC, QUẢN LÝ PHIM, ĐĂNG XUẤT
            arrayAccount = [Account(name: "Đăng danh mục mới", image: "danhmucmoi"),
                            Account(name: "Đăng phim mới", image: "phimmoi"),
                            Account(name: "Quản lý thành viên", image: "qluser"),
                            Account(name: "Quản lý danh mục", image: "qlcategory"),
                            Account(name: "Quản lý phim", image: "qlfilm"),
                            Account(name: "Đăng xuất", image: "logout")]
            
            if arrayAccount.count > 5 {
                lbA.text = arrayAccount[0].name
                lbB.text = arrayAccount[1].name
                lbC.text = arrayAccount[2].name
                lbD.text = arrayAccount[3].name
                lbE.text = arrayAccount[4].name
                lbF.text = arrayAccount[5].name
                
                imgA.image = UIImage(named: arrayAccount[0].image)
                imgB.image = UIImage(named: arrayAccount[1].image)
                imgC.image = UIImage(named: arrayAccount[2].image)
                imgD.image = UIImage(named: arrayAccount[3].image)
                imgE.image = UIImage(named: arrayAccount[4].image)
                imgF.image = UIImage(named: arrayAccount[5].image)
            }
        }
    }
    
    @objc func tapOnViewA() {
        UIView.animate(withDuration: 0.3) {
            self.viewA.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewA.alpha = 1
            }
        }
        
        switch caseAccount {
        case .admin: // ĐĂNG DANH MỤC MỚI
            let vc = PostCategoryVC(nibName: "PostCategoryVC", bundle: nil)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case .user: // THÔNG TIN CÁ NHÂN
            return
        }
    }
    
    @objc func tapOnViewB() {
        UIView.animate(withDuration: 0.3) {
            self.viewB.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewB.alpha = 1
            }
        }
        
        switch caseAccount {
        case .admin: // ĐĂNG PHIM MỚI
            let vc = PostFilmVC(nibName: "PostFilmVC", bundle: nil)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case .user: // PHIM YÊU THÍCH
            return
        }
    }
    
    @objc func tapOnViewC() {
        UIView.animate(withDuration: 0.3) {
            self.viewC.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewC.alpha = 1
            }
        }
        
        switch caseAccount {
        case .admin: // QUẢN LÝ THÀNH VIÊN
            return
        case .user: // ĐÁNH GIÁ
            return
        }

    }
    
    @objc func tapOnViewD() {
        UIView.animate(withDuration: 0.3) {
            self.viewD.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewD.alpha = 1
            }
        }
        
        switch caseAccount {
        case .admin: //  QUẢN LÝ DANH MỤC
            return
        case .user: // GÓP Ý
            return
        }
    }
    
    @objc func tapOnViewE() {
        UIView.animate(withDuration: 0.3) {
            self.viewE.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewE.alpha = 1
            }
        }
        
        switch caseAccount {
        case .admin: // QUẢN LÝ PHIM
            return
        case .user: // ĐỔI MẬT KHẨU
            return
        }
    }
    
    @objc func tapOnViewF() { // ĐĂNG XUẤT
        UIView.animate(withDuration: 0.3) {
            self.viewF.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.viewF.alpha = 1
            }
        }
    }
}
