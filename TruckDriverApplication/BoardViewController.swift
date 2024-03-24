//
//  BoardViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/20/24.
//

class ShipperDelegate{
    static var selectedCarKey = ""
    static var boardTableView: UITableView?
    static var deliveryTableView: UITableView?
    static var claimedOrders: [Car] = []
}


import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ShipperDelegate.boardTableView = tableView
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
        
        var add = true
        var count = 0
        while add{
            if Delegate.orders[indexPath.row + count].deliverBy == ""{
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
    
    
    
    @IBAction func done(_ sender: Any) {
    
        self.dismiss(animated: true)
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        var add = true
        var count = 0
        while add{
            if Delegate.orders[indexPath.row + count].deliverBy == ""{
                ShipperDelegate.selectedCarKey = Delegate.orders[indexPath.row + count].key
                add = false
            } else{
                count += 1
            }
        }
        
        
        performSegue(withIdentifier: "moreInfo", sender: self)
    }
}
