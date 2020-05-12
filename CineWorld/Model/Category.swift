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
    var index = 0
    
    init(name: String, image: String, id: String, index: Int) {
        self.name = name
        self.image = image
        self.id = id
        self.index = index
    }
    
    init(fromDict: [String: Any]) {
        self.name = fromDict["name"] as? String ?? ""
        self.image = fromDict["image"] as? String ?? ""
        self.id = fromDict["id"] as? String ?? ""
        self.index = fromDict["index"] as? Int ?? 0
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "name": self.name,
            "image": self.image,
            "id": self.id,
            "index": self.index
        ]
    }
}
