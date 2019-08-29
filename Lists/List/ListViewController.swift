//
//  ListViewController.swift
//  Lists
//
//  Created by Brandon Fong on 7/18/19.
//  Copyright © 2019 Fiesta Togo Inc. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var newListTextField: UITextField!
    @IBOutlet weak var newListButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        newListTextField.delegate = self
        loadLists()
    }
    
    
    // MARK: - TableView DataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        cell.listNameTextField.text = lists[indexPath.row].title
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if newListTextField.text == "" { return false }
        lists.append(List(listTitle: newListTextField.text!)!)
        newListTextField.text = ""
        newListTextField.resignFirstResponder()
        saveLists()
        tableView.reloadData()
        return true
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveLists()
        }
    }
    
    // MARK: - UI Responsive Methods
    
    @IBAction func addNewList(_ sender: Any) {
        textFieldShouldReturn(newListTextField)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let itemTableViewController = segue.destination as! ItemTableViewController
        itemTableViewController.list = lists[(tableView.indexPathForSelectedRow?.row)!]
        itemTableViewController.navigationItem.title = itemTableViewController.list.title
    }
    

}
