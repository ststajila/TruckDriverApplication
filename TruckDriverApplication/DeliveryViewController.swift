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
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for ord in Delegate.orders{
            if ord.belongsTo == Delegate.currentSession{
                count+=1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        if Delegate.orders[indexPath.row].deliverBy == Delegate.currentSession{
            cell.modelLabel.text = "Model: \(Delegate.orders[indexPath.row].model)"
            cell.madeLabel.text = "Made: \(Delegate.orders[indexPath.row].made)"
            cell.yearLabel.text = "Year: \(Delegate.orders[indexPath.row].year)"
            cell.VINNumberLabel.text = "VIN: \(Delegate.orders[indexPath.row].vin)"
            cell.priceLabel.text = "Price: \(Delegate.orders[indexPath.row].cost)"
        }
        return cell
    }

}
