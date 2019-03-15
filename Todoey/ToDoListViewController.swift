//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by John James on 3/14/19.
//  Copyright © 2019 John James. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let todoList = ["one","two","three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableview:UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: cellForRowAt)
        cell.textLabel?.text = todoList[cellForRowAt.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(todoList[indexPath.row])")
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

