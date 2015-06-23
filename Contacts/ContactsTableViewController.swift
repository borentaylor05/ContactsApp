//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Taylor Boren on 6/22/15.
//  Copyright (c) 2015 Taylor Boren. All rights reserved.
//

import UIKit
// import Cocoa

class ContactsTableViewController: UITableViewController {
    
    var contacts = [Contact]()
    var names = ["Bob", "Lisa", "Tony", "Anne"]
    var addresses = ["Home", "Away", "1600 Pennsylvania Ave.", "Transylvania"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        makeContactList()
        let moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        navigationItem.leftBarButtonItem = moveButton
    }
    
    // initial table view
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
            let person = self.contacts[indexPath.row]
            if let name = person.name{
                cell.textLabel?.text = name
            }
            else{
                cell.textLabel?.text = "No Name"
            }
        return cell
    }
    
    // can edit table view
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Edit table view
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            self.contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // Reorder table view
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let movingContact = contacts.removeAtIndex(sourceIndexPath.row)
        contacts.insert(movingContact, atIndex: destinationIndexPath.row)
    }
    
    // hide delete when editing
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing{
            return .None
        }
        else{
            return .Delete
        }
    }
    
    // hide indent while editing
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of rows in section
        return self.contacts.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetails"{
            let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
            let contact = self.contacts[indexPath.row]
            var destination = segue.destinationViewController as! DetailViewController
            destination.contact = contact
        }
    }
    
    func makeContactList(){
        for i in 0...3{
            var person = Contact(name: names[i], phoneNumber: String(i), address: addresses[i])
            self.contacts.append(person)
        }
    }
    
    func toggleEdit(){
        tableView.setEditing(!tableView.editing, animated: true)
    }

}
