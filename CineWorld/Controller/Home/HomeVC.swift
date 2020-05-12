//
//  HomeVC.swift
//  CineWorld
//
//  Created by Trung iOS on 5/9/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import UIKit
import SDWebImage

class HomeVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayCategory = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        getCategory()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let nib = UINib(nibName: "CategoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "categoryCell")
    }
    
    func getCategory() {
        showLoading()
        databaseReference.child("Category").observe(.childAdded) { (snapshot) in
            databaseReference.child("Category").child(snapshot.key).observe(.value) { (snapshot1) in
                if let dict = snapshot1.value as? [String: Any] {
                    let category = Category(fromDict: dict)
                    self.arrayCategory.append(category)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.hideLoading()
                    }
                }
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            let nib = UINib(nibName: "CategoryColCell", bundle: nil)
            cell.collectionView.register(nib, forCellWithReuseIdentifier: "categoryColCell")
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 160
        default:
            return 0
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return arrayCategory.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryColCell", for: indexPath) as! CategoryColCell
            let category = arrayCategory[indexPath.row]
            cell.lbCategory.text = category.name
            if let url = URL(string: category.image) {
                cell.imgCategory.sd_setImage(with: url, completed: nil)
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 120, height: 140)
        default:
            return CGSize.zero
        }
    }
    
}
