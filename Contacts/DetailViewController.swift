//
//  DetailViewController.swift
//  Contacts
//
//  Created by Taylor Boren on 6/22/15.
//  Copyright (c) 2015 Taylor Boren. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = self.contact{
            if let name = contact.name{
                nameLabel.text = "Name: \(name)"
            }
            else{
                nameLabel.text = "No Name"
            }
            if let phone = contact.phoneNumber{
                self.phoneNumberLabel.text = "Phone Number: \(phone)"
            }
            else{
                self.phoneNumberLabel.text = "No phone number"
            }
            if let address = contact.address{
                addressLabel.text = "Address: \(address)"
            }
            else{
                addressLabel.text = "No Address"
            }
        }
    }

}
