//
//  DeliveryViewController.swift
//  TruckDriverApplication
//
//  Created by Stanislav Stajila on 3/22/24.
//


import UIKit

class DeliveryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ShipperDelegate.deliveryTableView = tableView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ShipperDelegate.claimedOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
                cell.modelLabel.text = "Model: \(ShipperDelegate.claimedOrders[indexPath.row].model)"
                cell.madeLabel.text = "Made: \(ShipperDelegate.claimedOrders[indexPath.row].made)"
                cell.yearLabel.text = "Year: \(ShipperDelegate.claimedOrders[indexPath.row].year)"
                cell.VINNumberLabel.text = "VIN: \(ShipperDelegate.claimedOrders[indexPath.row].vin)"
                cell.priceLabel.text = "Price: $\(ShipperDelegate.claimedOrders[indexPath.row].cost)"
                
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        for i in 0 ..< Delegate.orders.count{
            if Delegate.orders[i].key == ShipperDelegate.claimedOrders[indexPath.row].key{
                ShipperDelegate.selectedCarKey = ShipperDelegate.claimedOrders[indexPath.row].key
                break
            }
            
        }
        
        performSegue(withIdentifier: "status", sender: self)
    }
}
