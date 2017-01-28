//
//  User.swift
//  FunToUseTheUser
//
//  Created by Harold Davis on 1/27/17.
//  Copyright © 2017 Harold Davis. All rights reserved.
//

import Foundation
import JavaScriptCore


struct contactInfo {
    var phone: String
    var website: String
    var company: String
    var name: String
    var catchFrase: String
    var bs: String
}



class UserAddress {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    
    init(street: String, suite: String, city: String, zipcode: String) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }

}

class UserInfo {
    var id: String = ""
    var name: String = ""
    var email: String = ""
    var username: String = ""
    
    init(name: String, email: String, username: String, id: String) {
        self.name = name
        self.email = email
        self.username = username
        self.id = id
    }


}







