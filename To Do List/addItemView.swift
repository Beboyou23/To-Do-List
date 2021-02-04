//
//  addItemView.swift
//  To Do List
//
//  Created by Student on 2/3/21.
//

import SwiftUI

struct addItemView: View {
    @ObservedObject var toDoList: ToDoList
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["High", "Medium", "Low"]
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Priority", selection: $priority){
                    ForEach(Self.priorities, id: \.self) { priority in Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New To-Do Item")
            .navigationBarItems(trailing: Button("Save"){
                if(priority.count > 0 && description.count > 0) {
                    let item = ToDoItem(id:UUID(),
                                    priority: priority,
                                    description: description,
                                    dueDate: dueDate)
                    toDoList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct addItemView_Previews: PreviewProvider {
    static var previews: some View {
        addItemView(toDoList: ToDoList())
    }
}
