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
    
    var alert = UIAlertController(title: "Error", message: "Invalid login or password", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "Ok", style: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Delegate.ref = Database.database().reference()

        Delegate.ref.child("shippers").observe(.childAdded) { DataSnapshot in
            
            let dict = DataSnapshot.value as! [String: Any]
            let s = Shipper(dict: dict)
            s.key = DataSnapshot.key
            Delegate.shippers.append(s)
            
            
        }  
        
        Delegate.ref.child("customer").observe(.childAdded) { DataSnapshot in
            
            let dict = DataSnapshot.value as! [String: Any]
            var c = Customer(dict: dict)
            c.key = DataSnapshot.key
            Delegate.customers.append(c)
            
        }
        
        Delegate.ref.child("orders").observe(.childAdded) { DataSnapshot in
            
            let dict = DataSnapshot.value as! [String: Any]
            
            let car = Car(dict: dict)
            car.key = DataSnapshot.key
            
            Delegate.orders.append(car)
        }
        
        Delegate.ref.child("customer").observeSingleEvent(of: .value) { DataSnapshot in
            print("ready")
        }
        
        Delegate.ref.child("shippers").observeSingleEvent(of: .value) { DataSnapshot in
            print("ready")
        }
        
        Delegate.ref.child("orders").observeSingleEvent(of: .value) { DataSnapshot in
            print("ready")
        }
        
        alert.addAction(alertAction)
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
    
        if isCustomer(email: emailOutlet.text!, password: passwordOutlet.text!){
            performSegue(withIdentifier: "customerAccount", sender: self)
        } else if isShipper(email: emailOutlet.text!, password: passwordOutlet.text!){
            
            ShipperDelegate.waitingForDelivery = []
            ShipperDelegate.claimedOrders = []
            ShipperDelegate.completedOrders = []
            
            for orders in Delegate.orders{
                if orders.deliverBy == ""{
                    ShipperDelegate.waitingForDelivery.append(orders)
                }else{
                    if orders.deliverBy == Delegate.currentSession{
                        if orders.completed{
                            ShipperDelegate.completedOrders.append(orders)
                        }else{
                            ShipperDelegate.claimedOrders.append(orders)
                        }
                    }
                }
            }
            
            performSegue(withIdentifier: "shipperAccount", sender: self)
        }else{
            present(alert, animated: true)
        }
        
        
    }
    
    
    func isCustomer(email: String, password: String) -> Bool{
        for c in Delegate.customers{
            if c.email == email && c.password == password{
               Delegate.currentSession = c.key
                return true
            }
        }
        return false
    }
    
    func isShipper(email: String, password: String) -> Bool{
        for s in Delegate.shippers{
            if s.email == email && s.password == password{
                Delegate.currentSession = s.key
                return true
            }
        }
        return false
    }
}
