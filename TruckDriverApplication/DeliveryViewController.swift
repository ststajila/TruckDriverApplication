//
//  DeliveryViewController.swift
//  TruckDriverApplication
//
//  Created by Stanislav Stajila on 3/22/24.
//


import UIKit

class DeliveryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var claimedOrders: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ShipperDelegate.deliveryTableView = tableView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        for ord in Delegate.orders{
            if ord.deliverBy == Delegate.currentSession && ord.completed == false{
                count += 1
            }
        }
        
        claimedOrders = []
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
        var add = true
        var count = 0
        while add{
            if Delegate.orders[indexPath.row + count].deliverBy == Delegate.currentSession && Delegate.orders[indexPath.row + count].completed == false{
                cell.modelLabel.text = "Model: \(Delegate.orders[indexPath.row + count].model)"
                cell.madeLabel.text = "Made: \(Delegate.orders[indexPath.row + count].made)"
                cell.yearLabel.text = "Year: \(Delegate.orders[indexPath.row + count].year)"
                cell.VINNumberLabel.text = "VIN: \(Delegate.orders[indexPath.row + count].vin)"
                cell.priceLabel.text = "Price: \(Delegate.orders[indexPath.row + count].cost)"
                
                claimedOrders.append(Delegate.orders[indexPath.row + count])
                
                add = false
            } else{
                count += 1
            }
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        for i in 0 ..< Delegate.orders.count{
            
            if Delegate.orders[i].key == claimedOrders[indexPath.row].key{
                ShipperDelegate.selectedCarKey = Delegate.orders[i].key
                break
            }
        }
        
        performSegue(withIdentifier: "status", sender: self)
    }
}
