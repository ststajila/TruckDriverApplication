//
//  NewAccountViewController.swift
//  TruckDriverApplication
//
//  Created by STANISLAV STAJILA on 3/6/24.
//

import UIKit

class Delegate{
    static var customers: [Customer] = []
    static var shippers: [Shipper] = []
    
}

class NewAccountViewController: UIViewController {
    
    
    
    @IBOutlet weak var statusOutlet: UILabel!
    @IBOutlet weak var accountSelectionOutlet: UISegmentedControl!
    @IBOutlet weak var firstNameOutlet: UITextField!
    @IBOutlet weak var lastNameOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var confirmEmailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var confirmPasswordOutlet: UITextField!
    @IBOutlet weak var companynameOutlet: UITextField!
    @IBOutlet weak var DOTOutlet: UITextField!
    @IBOutlet weak var MCOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusOutlet.backgroundColor = UIColor.green
    }
    

    @IBAction func createNewAccountAction(_ sender: Any) {
        
        if accountSelectionOutlet.selectedSegmentIndex == 0{
            if firstNameOutlet.text != "" && lastNameOutlet.text != ""{
                
            }else{
                statusOutlet.backgroundColor = UIColor.red
                statusOutlet.text = "First and Last Name are Required Fields"
            }
        } else{
            print("Shipper")
            cancelAction(self)
        }
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
   
}
