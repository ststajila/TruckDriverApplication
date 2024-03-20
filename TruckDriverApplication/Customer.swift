//
//  Customer.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/7/24.
//

import Foundation
class Customer{
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var key = ""
    var orders: [Car] = []
    
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    init(dict: [String: Any]){
        if let fn = dict["firstName"] as? String{
            firstName = fn
        } else{
            firstName = ""
        }
        
        if let ln = dict["lastName"] as? String{
            lastName = ln
        } else{
            lastName = ""
        }
        
        if let e = dict["email"] as? String{
            email = e
        } else{
            email = ""
        }
        
        if let p = dict["password"] as? String{
            password = p
        } else{
            password = ""
        }
        
    }
}
