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

    @IBOutlet weak var madeOutlet: UITextField!
    @IBOutlet weak var modelOutlet: UITextField!
    @IBOutlet weak var yearOutlet: UITextField!
    @IBOutlet weak var vinNumberOutlet: UITextField!
    @IBOutlet weak var costOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrder(_ sender: Any) {
    
        if let y = Int(yearOutlet.text!){
            if let c =  Double(costOutlet.text!){
                var car = Car(made: madeOutlet.text!, model: modelOutlet.text!, year: y, vin: vinNumberOutlet.text!, cost: c)
                
                for c in Delegate.customers{
                    if c.key == Delegate.currentSession{
                        c.orders.append(car)
                    }
                }
                
            }
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
