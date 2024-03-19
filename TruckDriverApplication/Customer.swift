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
        
        if let d = dict["orders"] as? String{
            
            var made = ""
            var model = ""
            var year = 0
            var vin = ""
            var cost = 0.0
            
            if let m = dict["made"] as? String{
                made = m
            }
            if let m = dict["model"] as? String{
                model = m
            }
            if let y = dict["year"] as? Int{
                year = y
            }
            if let v = dict["vin"] as? String{
                vin = v
            }
            if let c = dict["cost"] as? Double{
                cost = c
            }
            
            let car = Car(made: made, model: model, year: year, vin: vin, cost: cost)
            orders.append(car)
            
        } else{
            orders = []
        }
        
    }
}
