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
    
    // -may need to use this method later?    init(phone: String, website: String, company: String, nam){}
}



class UserAddress {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    
    //var userInfo: contactInfo
    
    
    init(street: String, suite: String, city: String, zipcode: String) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode

    }
    
    

}

class UserInfo {
    var userId: String = ""
    var name: String = ""
    var email: String = ""
    var username: String = ""
    
    
    init(userid: String, name: String, email: String, username: String) {
        self.name = name
        self.email = email
        self.username = username
        self.userId = userid
    }


}







