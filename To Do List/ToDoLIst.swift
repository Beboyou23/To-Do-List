//
//  ToDoLIst.swift
//  To Do List
//
//  Created by Student on 2/1/21.
//

import Foundation

class ToDoList: ObservableObject {
    @Published var items : [ToDoItem] {
           didSet {
               let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(items) {
                   UserDefaults.standard.set(encoded, forKey: "data")
               }
           }
       }
    init() {
           if let items = UserDefaults.standard.data(forKey: "data") {
               let decoder = JSONDecoder()
               if let decoded = try? decoder.decode([ToDoItem].self, from: items) {
                   self.items = decoded
                   return
               }
           }
           items = []
       }
}

