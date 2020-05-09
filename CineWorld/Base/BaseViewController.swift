//
//  BaseViewController.swift
//  CineWorld
//
//  Created by Trung iOS on 5/9/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import Foundation
import Toast_Swift
import JGProgressHUD

class BaseViewController: UIViewController {
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    let hud = JGProgressHUD(style: .dark)

    func roundCorner(views: [UIView], radius: CGFloat) {
        views.forEach { (view) in
            view.layer.masksToBounds = true
            view.layer.cornerRadius = radius
        }
    }
    
    func addBorder(views: [UIView], width: CGFloat, color: CGColor) {
        views.forEach { (view) in
            view.layer.borderWidth = width
            view.layer.borderColor = color
        }
    }
    
    func showToast(message: String, duration: Double = 3) {
        var style = ToastStyle()
        style.backgroundColor = #colorLiteral(red: 0, green: 0.4980392157, blue: 0.6470588235, alpha: 1)
        style.messageColor = .white
        style.messageFont = UIFont.boldSystemFont(ofSize: 16)
        self.view.makeToast(message, duration: duration, position: .bottom, style: style)
    }
    
    func addShadow(views: [UIView]) {
        views.forEach { (view) in
            view.layer.masksToBounds = true
            view.layer.shadowOpacity = 1
            view.layer.shadowOffset = CGSize(width: 2, height: 2)
            view.layer.shadowColor = UIColor.darkGray.cgColor
            view.clipsToBounds = false
            view.backgroundColor = .white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        let touch: UITouch? = touches.first
        if touch?.view?.tag == 10 {
            dismiss(animated: true, completion: nil)
        }
    }
}


extension BaseViewController {
    func showLoading() {
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
    }
    
    func showLoadingSuccess(_ delay: Double = 3) {
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.textLabel.text = "Success"
        hud.show(in: self.view)
        hud.dismiss(afterDelay: delay)
    }
    
    func hideLoading() {
        hud.dismiss()
    }
    
    func getYoutubeId(youtubeUrl: String) -> String? {
        return URLComponents(string: youtubeUrl)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
}

