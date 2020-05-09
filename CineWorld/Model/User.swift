//
//  User.swift
//  CineWorld
//
//  Created by Trung iOS on 5/9/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class User {
    var phone = ""
    var name = ""
    var id = ""
    var birthday = ""
    var password = ""
    var avatar = ""
    
    init(phone: String, name: String, id: String, birthday: String, password: String, avatar: String) {
        self.phone = phone
        self.name = name
        self.id = id
        self.birthday = birthday
        self.password = password
        self.avatar = avatar
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "phone": self.phone,
            "name": self.name,
            "id": self.id,
            "birthday": self.birthday,
            "password": self.password,
            "avatar": self.avatar
        ]
    }
    
    init(fromDict: [String: Any]) {
        self.phone = fromDict["phone"] as? String ?? ""
        self.name = fromDict["name"] as? String ?? ""
        self.id = fromDict["id"] as? String ?? ""
        self.birthday = fromDict["birthday"] as? String ?? ""
        self.password = fromDict["password"] as? String ?? ""
        self.avatar = fromDict["avatar"] as? String ?? ""
    }
}
