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
    static var completedTableView: UITableView?
    static var waitingForDelivery: [Car] = []
    static var claimedOrders: [Car] = []
    static var completedOrders: [Car] = []
    
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
        
        return ShipperDelegate.waitingForDelivery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
                cell.modelLabel.text = "Model: \(ShipperDelegate.waitingForDelivery[indexPath.row].model)"
                cell.madeLabel.text = "Made: \(ShipperDelegate.waitingForDelivery[indexPath.row].made)"
                cell.yearLabel.text = "Year: \(ShipperDelegate.waitingForDelivery[indexPath.row].year)"
                cell.VINNumberLabel.text = "VIN: \(ShipperDelegate.waitingForDelivery[indexPath.row].vin)"
                cell.priceLabel.text = "Price: $\(ShipperDelegate.waitingForDelivery[indexPath.row].cost)"
                
        return cell
    }
    
    
    
    @IBAction func done(_ sender: Any) {
    
        self.dismiss(animated: true)
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        ShipperDelegate.selectedCarKey = ShipperDelegate.waitingForDelivery[indexPath.row].key
        
        performSegue(withIdentifier: "moreInfo", sender: self)
    }
}
