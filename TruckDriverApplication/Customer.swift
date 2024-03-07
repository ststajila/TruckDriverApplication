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
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
