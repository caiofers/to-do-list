//
//  ViewController.swift
//  To Do List
//
//  Created by Caio Fernandes on 22/03/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var listOfToDo: [ToDoItemCodable] = []
    let listObj = ListOfItens()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listOfToDo = listObj.listAll()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = "reuseToDoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath) as! ToDoItemCell
        let toDoItem = listOfToDo[indexPath.row]
        cell.ToDoDescriptionLabel.text = toDoItem.todoDescription
        cell.ToDoPriorityLabel.text = toDoItem.priority
        cell.ToDoFinalDateLabel.text = toDoItem.finalDate
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listObj.remove(at: indexPath.row)
            listOfToDo = listObj.listAll()
            tableView.reloadData()
        }
    }

}

