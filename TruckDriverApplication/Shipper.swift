//
//  Shipper.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/7/24.
//

import Foundation
class Shipper{
    var firstName: String
    var lastName: String
    var companyName: String
    var DOTNumber: Int
    var MCNumber: Int
    var email: String
    var password: String
    var key = ""
    var orders: [Car] = []
    
    init(firstName: String, lastName: String, companyName: String, DOTNumber: Int, MCNumber: Int, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
        self.DOTNumber = DOTNumber
        self.MCNumber = MCNumber
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
        
        if let cn = dict["companyName"] as? String{
            companyName = cn
        } else{
            companyName = ""
        }
        
        if let dot = dict["DOTNumber"] as? Int{
            DOTNumber = dot
        } else{
            DOTNumber = 0
        }
        
        if let mc = dict["MCNumber"] as? Int{
            MCNumber = mc
        } else{
            MCNumber = 0
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
