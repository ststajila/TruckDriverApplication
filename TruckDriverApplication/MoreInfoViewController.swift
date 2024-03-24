//
//  MoreInfoViewController.swift
//  TruckDriverApplication
//
//  Created by Stanislav Stajila on 3/23/24.
//

import UIKit

class MoreInfoViewController: UIViewController {

    
    @IBOutlet weak var madeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var VINLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(alertAction)
        
        print("Hi")
        
        for ord in Delegate.orders{
            
            print("Inside")
            if ord.key == ShipperDelegate.selectedCarKey{
                madeLabel.text = "Made: \(ord.made)"
                modelLabel.text = "Model: \(ord.model)"
                yearLabel.text = "Year: \(ord.year)"
                VINLabel.text = "VIN: \(ord.vin)"
                costLabel.text = "Cost: \(ord.cost)"
                break
            }
        }
    }
    
    @IBAction func claim(_ sender: Any) {
        for i in 0 ..< Delegate.orders.count{
            if Delegate.orders[i].key == ShipperDelegate.selectedCarKey{
                if Delegate.orders[i].deliverBy == ""{
                    var ordersDict = ["made": Delegate.orders[i].made, "model": Delegate.orders[i].model, "year": Delegate.orders[i].year, "vin": Delegate.orders[i].vin, "cost": Delegate.orders[i].cost, "belongsTo": Delegate.orders[i].belongsTo, "deliverBy": Delegate.currentSession] as [String: Any]
                    
                    Delegate.ref.child("orders").child(ShipperDelegate.selectedCarKey).updateChildValues(ordersDict)
                    
                    Delegate.orders[i].deliverBy = Delegate.currentSession
                    
                    alert.title = "Success"
                    alert.message = "Car was added to your delivery list"
                    
                    present(alert, animated: true)
                    
                    ShipperDelegate.boardTableView!.reloadData()
                    ShipperDelegate.deliveryTableView!.reloadData()
                    
                    break
                    
                } else{
                    alert.title = "Error"
                    alert.message = "The car was already claimed"
                    present(alert, animated: true)
                    break
                }
            }
        }
    }
    
}
