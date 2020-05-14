//
//  NewColCell.swift
//  CineWorld
//
//  Created by Trung iOS on 5/9/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit

class NewColCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lbFilmName: UILabel!
    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var lbStar: UILabel!
    @IBOutlet weak var lbComment: UILabel!
    @IBOutlet weak var lbView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCell.layer.cornerRadius = ROUND_CORNER_VIEW_POPUP
        viewCell.clipsToBounds = true
    }

}
