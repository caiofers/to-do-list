//
//  ListOfitens.swift
//  To Do List
//
//  Created by Caio Fernandes on 22/03/21.
//

import UIKit

class ListOfItens{
    
    let key = "toDoList"
    var list: [ToDoItemCodable] = []
    
    func save(item toDoItem: ToDoItem) -> Void {
        let toDoItemCodable = ToDoItemCodable(todoDescription: toDoItem.todoDescription, priority: nil, finalDate: nil)
        list = listAll()
        
        list.append(toDoItemCodable)
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(list)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    func listAll() -> [ToDoItemCodable] {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let list = try decoder.decode([ToDoItemCodable].self, from: data)
                return list

            } catch {
                print("Unable to Decode Notes (\(error))")
                return []
            }
        }
        return []
    }
    
    func remove(at index: Int) -> Void {
        list = listAll()
        list.remove(at: index)
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(list)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
}

struct ToDoItemCodable: Codable {
    let todoDescription: String!
    let priority: String?
    let finalDate: String?
}
