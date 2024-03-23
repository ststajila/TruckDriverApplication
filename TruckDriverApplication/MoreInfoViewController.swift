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
    var alert = UIAlertController(title: "Success", message: "Car was added to your delivery list", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "Ok", style: .cancel) { UIAlertAction in
        ShipperDelegate.tableView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(alertAction)

        madeLabel.text = "Made: \(Delegate.orders[ShipperDelegate.indexOfOrder].made)"
        modelLabel.text = "Model: \(Delegate.orders[ShipperDelegate.indexOfOrder].model)"
        yearLabel.text = "Year: \(Delegate.orders[ShipperDelegate.indexOfOrder].year)"
        VINLabel.text = "VIN: \(Delegate.orders[ShipperDelegate.indexOfOrder].vin)"
        costLabel.text = "Cost: \(Delegate.orders[ShipperDelegate.indexOfOrder].cost)"
    }
    @IBAction func claim(_ sender: Any) {
        if Delegate.orders[ShipperDelegate.indexOfOrder].deliverBy == ""{
            var ordersDict = ["made": Delegate.orders[ShipperDelegate.indexOfOrder].made, "model": Delegate.orders[ShipperDelegate.indexOfOrder].model, "year": Delegate.orders[ShipperDelegate.indexOfOrder].year, "vin": Delegate.orders[ShipperDelegate.indexOfOrder].vin, "cost": Delegate.orders[ShipperDelegate.indexOfOrder].cost, "belongsTo": Delegate.orders[ShipperDelegate.indexOfOrder].belongsTo, "deliverBy": Delegate.currentSession] as [String: Any]
            Delegate.ref.child("orders").child(Delegate.orders[ShipperDelegate.indexOfOrder].key).updateChildValues(ordersDict)
            
            alert.title = "Success"
            alert.message = "Car was added to your delivery list"
            Delegate.orders[ShipperDelegate.indexOfOrder].deliverBy = Delegate.currentSession
            present(alert, animated: true)
        } else{
            alert.title = "Error"
            alert.message = "The car was already claimed"
            present(alert, animated: true)
        }
    }
    
}
