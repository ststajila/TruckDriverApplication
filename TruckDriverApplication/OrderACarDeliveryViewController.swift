//
//  OrderACarDeliveryViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/13/24.
//

class Car{
    var made: String
    var model: String
    var year: Int
    var vin: String
    var cost: Double
    
    init(made: String, model: String, year: Int, vin: String, cost: Double) {
        self.made = made
        self.model = model
        self.year = year
        self.vin = vin
        self.cost = cost
    }
}


import UIKit

class OrderACarDeliveryViewController: UIViewController {
    
    var alertControler = UIAlertController(title: "Invalid Format", message: "", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

    @IBOutlet weak var madeOutlet: UITextField!
    @IBOutlet weak var modelOutlet: UITextField!
    @IBOutlet weak var yearOutlet: UITextField!
    @IBOutlet weak var vinNumberOutlet: UITextField!
    @IBOutlet weak var costOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertControler.addAction(alertAction)
    }
    
    @IBAction func placeOrder(_ sender: Any) {
    
        if madeOutlet.hasText && modelOutlet.hasText{
            
            var custDict: [String : Any]?
            
            if let y = Int(yearOutlet.text!){
                if vinNumberOutlet.hasText {
                    
                    if let c =  Double(costOutlet.text!){
                        var car = Car(made: madeOutlet.text!, model: modelOutlet.text!, year: y, vin: vinNumberOutlet.text!, cost: c)
                        
                        for c in Delegate.customers{
                            if c.key == Delegate.currentSession{
                                c.orders.append(car)
                                
                                var ordersDict = ["made": car.made, "model": car.model, "year": car.year, "vin": car.vin, "cost": car.cost] as [String: Any]
                                custDict = ["firstName": c.firstName, "lastName": c.lastName, "email": c.email, "password": c.password, "orders": ordersDict]
                            }
                         
                            CTDelegate.tableView.reloadData()
                            
                            if let c = custDict{
                                Delegate.ref.child("customer").child(Delegate.currentSession).updateChildValues(c)
                                self.dismiss(animated: true)
                            }
                            
                        }
                        
                        
                        
                    }else{
                        alertControler.title = "Invalid Data Format"
                        alertControler.message = "Cost is a required field and must be a double"
                        present(alertControler, animated: true)
                    }
                }else{
                    alertControler.title = "Required Field is Blank"
                    alertControler.message = "VIN number is required"
                    present(alertControler, animated: true)
                }
            }else{
                alertControler.title = "Invalid Data Format"
                alertControler.message = "Year is a required field and must contain a whole number"
                present(alertControler, animated: true)
            }
        }else{
            alertControler.title = "Required Field is Blank"
            alertControler.message = "Made and Model are required fields!"
            present(alertControler, animated: true)
        }
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
