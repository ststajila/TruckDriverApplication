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
    
    init(firstName: String, lastName: String, companyName: String, DOTNumber: Int, MCNumber: Int, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
        self.DOTNumber = DOTNumber
        self.MCNumber = MCNumber
        self.email = email
        self.password = password
    }
}
