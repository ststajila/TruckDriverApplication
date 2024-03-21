//
//  BoardViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/20/24.
//

import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Delegate.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarCell
        
        cell.modelLabel.text = "Model: \(Delegate.orders[indexPath.row].model)"
        cell.madeLabel.text = "Made: \(Delegate.orders[indexPath.row].made)"
        cell.yearLabel.text = "Year: \(Delegate.orders[indexPath.row].year)"
        cell.VINNumberLabel.text = "VIN: \(Delegate.orders[indexPath.row].vin)"
        cell.priceLabel.text = "Price: \(Delegate.orders[indexPath.row].cost)"
        return cell
    }
    
    
    
    @IBAction func done(_ sender: Any) {
    
        self.dismiss(animated: true)
        
    }
    

}
