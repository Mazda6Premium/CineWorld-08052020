//
//  Category.swift
//  CineWorld
//
//  Created by Trung iOS on 5/12/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class Category {
    var name = ""
    var image = ""
    var id = ""
    
    init(name: String, image: String, id: String) {
        self.name = name
        self.image = image
        self.id = id
    }
    
    init(fromDict: [String: Any]) {
        self.name = fromDict["name"] as? String ?? ""
        self.image = fromDict["image"] as? String ?? ""
        self.id = fromDict["id"] as? String ?? ""
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "name": self.name,
            "image": self.image,
            "id": self.id
        ]
    }
}
