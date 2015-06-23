//
//  Contact.swift
//  Contacts
//
//  Created by Taylor Boren on 6/22/15.
//  Copyright (c) 2015 Taylor Boren. All rights reserved.
//

import Foundation

class Contact {
    var name:String?
    var phoneNumber:String?
    var address:String?
    init(name:String? = nil, phoneNumber:String? = nil, address:String? = nil){
        self.name = name
        self.phoneNumber = phoneNumber
        self.address = address
    }
}