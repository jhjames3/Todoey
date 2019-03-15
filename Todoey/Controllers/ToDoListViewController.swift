//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by John James on 3/14/19.
//  Copyright © 2019 John James. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var todoList = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newItem = Item()
        newItem.title = "one"
        todoList.append( newItem)
        let newItem2 = Item()
        newItem2.title = "two"
        todoList.append( newItem2)
        let newItem3 = Item()
        newItem3.title = "three"
        todoList.append( newItem3)
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableview:UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: cellForRowAt)
        let item = todoList[cellForRowAt.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(todoList[indexPath.row])")
        todoList[indexPath.row].done = !(todoList[indexPath.row]).done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Mark -  Add new item

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when user presses add button
            let newItem = Item()
            newItem.title = textField.text!
            self.todoList.append(newItem)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Item Text"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

