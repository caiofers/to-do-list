//
//  ToDoItem.swift
//  To Do List
//
//  Created by Caio Fernandes on 22/03/21.
//

import Foundation

class ToDoItem {
    var todoDescription: String!
    var priority: Priority?
    var finalDate: Date?
    
    init(description: String, priority: Priority? = nil, finalDate: Date? = nil) {
        self.todoDescription = description
        self.priority = priority
        self.finalDate = finalDate
    }
}
