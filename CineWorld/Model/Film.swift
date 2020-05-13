//
//  Film.swift
//  CineWorld
//
//  Created by Trung iOS on 5/13/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class Film {
    var name = ""
    var id = ""
    var index = 0
    var noComment = 0
    var noView = 0
    var noStar = 0
    var description = ""
    var link = ""
    var category = ""
    var type = ""
    
    init(name: String, id: String, index: Int, noComment: Int, noView: Int, noStar: Int, description: String, link: String, category: String, type: String) {
        self.name = name
        self.id = id
        self.index = index
        self.noComment = noComment
        self.noView = noView
        self.noStar = noStar
        self.description = description
        self.link = link
        self.category = category
        self.type = type
    }
    
    init(fromDict: [String: Any]) {
        self.name = fromDict["name"] as? String ?? ""
        self.id = fromDict["id"] as? String ?? ""
        self.index = fromDict["index"] as? Int ?? 0
        self.noComment = fromDict["noComment"] as? Int ?? 0
        self.noView = fromDict["noView"] as? Int ?? 0
        self.noStar = fromDict["noStar"] as? Int ?? 0
        self.description = fromDict["description"] as? String ?? ""
        self.link = fromDict["link"] as? String ?? ""
        self.category = fromDict["category"] as? String ?? ""
        self.type = fromDict["type"] as? String ?? ""
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "name": self.name,
            "id": self.id,
            "index": self.index,
            "noComment": self.noComment,
            "noView": self.noView,
            "noStar": self.noStar,
            "description": self.description,
            "link": self.link,
            "category": self.category,
            "type": self.type
        ]
    }
}
