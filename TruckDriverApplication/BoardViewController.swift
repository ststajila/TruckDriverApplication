//
//  BoardViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/20/24.
//

class ShipperDelegate{
    static var indexOfOrder = -1
    static var tableView: UITableView?
}


import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ShipperDelegate.tableView = tableView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        for ord in Delegate.orders{
            if ord.deliverBy == ""{
                count += 1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        if Delegate.orders[indexPath.row].deliverBy == ""{
            cell.modelLabel.text = "Model: \(Delegate.orders[indexPath.row].model)"
            cell.madeLabel.text = "Made: \(Delegate.orders[indexPath.row].made)"
            cell.yearLabel.text = "Year: \(Delegate.orders[indexPath.row].year)"
            cell.VINNumberLabel.text = "VIN: \(Delegate.orders[indexPath.row].vin)"
            cell.priceLabel.text = "Price: \(Delegate.orders[indexPath.row].cost)"
        }
        return cell
    }
    
    
    
    @IBAction func done(_ sender: Any) {
    
        self.dismiss(animated: true)
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        ShipperDelegate.indexOfOrder = indexPath.row
        performSegue(withIdentifier: "moreInfo", sender: self)
    }
}
