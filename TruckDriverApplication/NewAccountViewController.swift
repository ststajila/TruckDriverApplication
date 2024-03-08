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
        
        statusOutlet.backgroundColor = UIColor.green
        statusOutlet.text = "Creating an account is in progress..."
        
        if accountSelectionOutlet.selectedSegmentIndex == 0{
            if firstNameOutlet.hasText && lastNameOutlet.hasText{
                if emailOutlet.hasText && emailOutlet.text!.contains(String(repeating: Character("@"), count: 1)){
                    if emailOutlet.text == confirmEmailOutlet.text{
                        
                        if passwordOutlet.hasText{
                            if passwordOutlet.text == confirmPasswordOutlet.text{
                                Delegate.customers.append(Customer(firstName: firstNameOutlet.text!, lastName: lastNameOutlet.text!, email: emailOutlet.text!, password: passwordOutlet.text!))
                            }else{
                                statusOutlet.backgroundColor = UIColor.red
                                statusOutlet.text = "Passwords do not match"
                            }
                        }else{
                            statusOutlet.backgroundColor = UIColor.red
                            statusOutlet.text = "Password field is required"
                        }
                    }else{
                        statusOutlet.backgroundColor = UIColor.red
                        statusOutlet.text = "Email adresses do not match"
                    }
                }else{
                    statusOutlet.backgroundColor = UIColor.red
                    statusOutlet.text = "Email field cannot be blank and must cotain ''@'' and ''.''"
                }
            }else{
                statusOutlet.backgroundColor = UIColor.red
                statusOutlet.text = "First and Last Name are Required Fields"
            }
        } else{
            if accountSelectionOutlet.selectedSegmentIndex == 0{
                if firstNameOutlet.hasText && lastNameOutlet.hasText{
                    if emailOutlet.hasText && emailOutlet.text!.contains(String(repeating: Character("@"), count: 1)){
                        if emailOutlet.text == confirmEmailOutlet.text{
                            
                            if passwordOutlet.hasText{
                                if passwordOutlet.text == confirmPasswordOutlet.text{
                                    if companynameOutlet.hasText{
                                        if DOTOutlet.hasText{
                                            if let dot = Int(DOTOutlet.text!){
                                                if MCOutlet.hasText{
                                                    if let mc = Int(MCOutlet.text!){
                                                        Delegate.shippers.append(Shipper(firstName: firstNameOutlet.text!, lastName: lastNameOutlet.text!, companyName: companynameOutlet.text!, DOTNumber: dot, MCNumber: mc, email: emailOutlet.text!, password: passwordOutlet.text!))
                                                    }else{
                                                        statusOutlet.backgroundColor = UIColor.red
                                                        statusOutlet.text = "MC must contain only numbers"
                                                    }
                                                }else{
                                                    statusOutlet.backgroundColor = UIColor.red
                                                    statusOutlet.text = "MC Number is required"
                                                }
                                            }else{
                                                statusOutlet.backgroundColor = UIColor.red
                                                statusOutlet.text = "DOT must contain only numbers"
                                            }
                                        }else{
                                            statusOutlet.backgroundColor = UIColor.red
                                            statusOutlet.text = "DOT Number is required"
                                        }
                                    }else{
                                        statusOutlet.backgroundColor = UIColor.red
                                        statusOutlet.text = "Company Name is Required"
                                    }
                                }else{
                                    statusOutlet.backgroundColor = UIColor.red
                                    statusOutlet.text = "Passwords do not match"
                                }
                            }else{
                                statusOutlet.backgroundColor = UIColor.red
                                statusOutlet.text = "Password field is required"
                            }
                        }else{
                            statusOutlet.backgroundColor = UIColor.red
                            statusOutlet.text = "Email adresses do not match"
                        }
                    }else{
                        statusOutlet.backgroundColor = UIColor.red
                        statusOutlet.text = "Email field cannot be blank and must cotain ''@'' and ''.''"
                    }
                }else{
                    statusOutlet.backgroundColor = UIColor.red
                    statusOutlet.text = "First and Last Name are Required Fields"
                }
            }
            
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
   
}
