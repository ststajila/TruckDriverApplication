//
//  CompletedViewController.swift
//  TruckDriverApplication
//
//  Created by Stanislav Stajila on 3/22/24.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var completedOrders: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ShipperDelegate.completedTableView = tableView
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ShipperDelegate.completedOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
        cell.modelLabel.text = "Model: \(ShipperDelegate.completedOrders[indexPath.row].model)"
                cell.madeLabel.text = "Made: \(ShipperDelegate.completedOrders[indexPath.row].made)"
                cell.yearLabel.text = "Year: \(ShipperDelegate.completedOrders[indexPath.row].year)"
                cell.VINNumberLabel.text = "VIN: \(ShipperDelegate.completedOrders[indexPath.row].vin)"
                cell.priceLabel.text = "Price: $\(ShipperDelegate.completedOrders[indexPath.row].cost)"
                
        return cell
    }
}
