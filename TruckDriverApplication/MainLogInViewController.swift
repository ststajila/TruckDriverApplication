//
//  MainLogInViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/11/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class MainLogInViewController: UIViewController {

    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Delegate.ref = Database.database().reference()

        Delegate.ref.child("shippers").observe(.childAdded) { DataSnapshot in
            
            let dict = DataSnapshot.value as! [String: Any]
            Delegate.shippers.append(Shipper(dict: dict))
            
            
        }  
        
        Delegate.ref.child("customer").observe(.childAdded) { DataSnapshot in
            
            let dict = DataSnapshot.value as! [String: Any]
            Delegate.customers.append(Customer(dict: dict))
        }
        
        Delegate.ref.child("customer").observeSingleEvent(of: .value) { DataSnapshot in
            print("ready")
        }
        
        Delegate.ref.child("shippers").observeSingleEvent(of: .value) { DataSnapshot in
            print("ready")
        }
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
    
        if isCustomer(email: emailOutlet.text!, password: passwordOutlet.text!){
            performSegue(withIdentifier: "customerAccount", sender: self)
        } 
        
        if isShipper(email: emailOutlet.text!, password: passwordOutlet.text!){
            performSegue(withIdentifier: "shipperAccount", sender: self)
        }
        
        
    }
    
    
    func isCustomer(email: String, password: String) -> Bool{
        for c in Delegate.customers{
            if c.email == email && c.password == password{
                return true
            }
        }
        return false
    }
    
    func isShipper(email: String, password: String) -> Bool{
        for s in Delegate.shippers{
            if s.email == email && s.password == password{
                return true
            }
        }
        return false
    }
}
