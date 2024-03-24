//
//  IsDeliveredViewController.swift
//  TruckDriverApplication
//
//  Created by Stanislav Stajila on 3/23/24.
//

import UIKit

class IsDeliveredViewController: UIViewController {

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
        
        for ord in ShipperDelegate.claimedOrders{
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
    
    
    @IBAction func delivered(_ sender: Any) {
        
        for i in 0 ..< Delegate.orders.count{
            if Delegate.orders[i].key == ShipperDelegate.selectedCarKey{
                if Delegate.orders[i].completed == false{
                    Delegate.orders[i].completed = true
                    
                    var ordersDict = ["made":  Delegate.orders[i].made, "model": Delegate.orders[i].model, "year": Delegate.orders[i].year, "vin": Delegate.orders[i].vin, "cost": Delegate.orders[i].cost, "belongsTo": Delegate.orders[i].belongsTo, "deliverBy": Delegate.orders[i].deliverBy, "completed": true] as [String: Any]
                    
                    Delegate.ref.child("orders").child(ShipperDelegate.selectedCarKey).updateChildValues(ordersDict)
                    
                    ShipperDelegate.deliveryTableView?.reloadData()
                    
                    alert.title = "Success"
                    alert.message = "The order marked Delivered"
                    present(alert, animated: true)
                    
                    break
                }else{
                    alert.title = "Warning"
                    alert.message = "The order alrady marked delivered"
                    present(alert, animated: true)
                    break
                }
            }
        }
    
        
    }
    
}
