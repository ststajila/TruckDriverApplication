//
//  CustomerOrdersViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/13/24.
//

class CTDelegate{
    static var tableView: UITableView!
}


import UIKit

class CarCell: UITableViewCell{
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var madeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var VINNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}


class CustomerOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for car in Delegate.orders{
            if car.belongsTo == Delegate.currentSession{
                
                for c in Delegate.customers{
                    if c.key == Delegate.currentSession{
                        c.orders.append(car)
                    }
                }
            }
        }
        
        
        CTDelegate.tableView = tableViewOutlet
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
//        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for c in Delegate.customers{
            if c.key == Delegate.currentSession{
                print("\(c.orders.count)")
                return c.orders.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
        var myOrders: [Car] = []
        
        for c in Delegate.customers{
            if c.key == Delegate.currentSession{
                myOrders = c.orders
            }
        }
        
        cell.modelLabel.text = "Model: \(myOrders[indexPath.row].model)"
        cell.madeLabel.text = "Made: \(myOrders[indexPath.row].made)"
        cell.yearLabel.text = "Year: \(myOrders[indexPath.row].year)"
        cell.VINNumberLabel.text = "VIN: \(myOrders[indexPath.row].vin)"
        cell.priceLabel.text = "Price: \(myOrders[indexPath.row].cost)"
        return cell
    }
}
