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
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        for ord in Delegate.orders{
            if ord.deliverBy == Delegate.currentSession && ord.completed{
                count += 1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
        var add = true
        var count = 0
        while add{
            if Delegate.orders[indexPath.row + count].deliverBy == Delegate.currentSession && Delegate.orders[indexPath.row + count].completed{
                cell.modelLabel.text = "Model: \(Delegate.orders[indexPath.row + count].model)"
                cell.madeLabel.text = "Made: \(Delegate.orders[indexPath.row + count].made)"
                cell.yearLabel.text = "Year: \(Delegate.orders[indexPath.row + count].year)"
                cell.VINNumberLabel.text = "VIN: \(Delegate.orders[indexPath.row + count].vin)"
                cell.priceLabel.text = "Price: \(Delegate.orders[indexPath.row + count].cost)"
                
                add = false
            } else{
                count += 1
            }
        }
        return cell
    }
}
