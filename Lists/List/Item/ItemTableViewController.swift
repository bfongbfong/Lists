//
//  ItemTableViewController.swift
//  Lists
//
//  Created by Brandon Fong on 7/18/19.
//  Copyright © 2019 Fiesta Togo Inc. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var newItemNameTextField: UITextField!
    
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newItemNameTextField.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.items.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
     
    cell.item = list.items[indexPath.row]
    cell.itemTextField.text = cell.item.title
        // change the image of the checkbox based on the property "checked"
        
     
     // Configure the cell...
        
    cell.checkButton.setImage(cell.item.checked ? UIImage(named: "Checked") : UIImage(named: "Unchecked"), for: .normal)

     
     return cell
     }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveLists()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if newItemNameTextField.text == "" { return false }
        list.items.append(ListItem(itemTitle: newItemNameTextField.text!, checked: false)!)
        newItemNameTextField.text = ""
        newItemNameTextField.resignFirstResponder()
        saveLists()
        tableView.reloadData()
        return true
    }

    // MARK: - UI responsive methods
    
    @IBAction func newItemTapped(_ sender: Any) {
        textFieldShouldReturn(newItemNameTextField)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
