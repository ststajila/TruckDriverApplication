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
    var belongsTo: String
    var key = ""
    var deliverBy = ""
    var completed = false
    
    init(made: String, model: String, year: Int, vin: String, cost: Double, belongsTo: String) {
        self.made = made
        self.model = model
        self.year = year
        self.vin = vin
        self.cost = cost
        self.belongsTo = belongsTo
    }
    
    init(dict: [String: Any]){
        if let m = dict["made"] as? String{
            made = m
        }else{
            made = ""
        }
        if let m = dict["model"] as? String{
            model = m
        }else{
            model = ""
        }
        if let y = dict["year"] as? Int{
            year = y
        }else{
            year = 0
        }
        if let v = dict["vin"] as? String{
            vin = v
        }else{
            vin = ""
        }
        if let c = dict["cost"] as? Double{
            cost = c
        }else{
            cost = 0
        }
        if let b = dict["belongsTo"] as? String{
            belongsTo = b
        }else{
            belongsTo = ""
        }
        if let d = dict["deliverBy"] as? String{
            deliverBy = d
        }else{
            deliverBy = ""
        }
        if let c = dict["completed"] as? Bool{
            completed = c
        }else{
            completed = false
        }
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
                        var car = Car(made: madeOutlet.text!, model: modelOutlet.text!, year: y, vin: vinNumberOutlet.text!, cost: c, belongsTo: Delegate.currentSession)
                        
                        for c in Delegate.customers{
                            if c.key == Delegate.currentSession{
                                
                                c.orders.append(car)
                                
                                var ordersDict = ["made": car.made, "model": car.model, "year": car.year, "vin": car.vin, "cost": car.cost, "belongsTo": car.belongsTo] as [String: Any]
                                
                                Delegate.ref.child("orders").childByAutoId().setValue(ordersDict)
                            }
                         
                            CTDelegate.tableView.reloadData()
                            
                                self.dismiss(animated: true)
                            
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
