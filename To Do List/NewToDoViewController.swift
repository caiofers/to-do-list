//
//  NewToDoViewController.swift
//  To Do List
//
//  Created by Caio Fernandes on 22/03/21.
//

import UIKit

class NewToDoViewController: UIViewController {

    @IBOutlet weak var ToDoDescriptionTextField: UITextField!
    @IBOutlet weak var ToDoPriorityPicker: UIPickerView!
    @IBOutlet weak var ToDoFinalDatePicker: UIDatePicker!

    @IBAction func SaveButton(_ sender: Any) {
            
        if let text = ToDoDescriptionTextField.text{
            let list = ListOfItens()
            let description = text
            let priority = Priority.noPriority
            let finalDate = ToDoFinalDatePicker.date
            let toDoItem = ToDoItem(description: description, priority: priority, finalDate: finalDate)
            list.save(item: toDoItem)
            ToDoDescriptionTextField.text = ""
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
