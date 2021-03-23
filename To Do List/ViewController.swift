//
//  ViewController.swift
//  To Do List
//
//  Created by Caio Fernandes on 22/03/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var listOfToDo: [ToDoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }
    
    func populate() -> Void {
        listOfToDo.append(ToDoItem(description: "Teste1"))
        listOfToDo.append(ToDoItem(description: "Teste2"))
        listOfToDo.append(ToDoItem(description: "Teste3"))
        listOfToDo.append(ToDoItem(description: "Teste4"))
        listOfToDo.append(ToDoItem(description: "Teste5"))
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
        cell.ToDoDescriptionLabel.text = toDoItem.description
        //cell.ToDoPriorityLabel.text = toDoItem.priority
        //cell.ToDoFinalDateLabel.text = toDoItem.finalDate
    
        return cell
    }


}

