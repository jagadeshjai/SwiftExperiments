//
//  TaskListView.swift
//  SwiftExperiments
//
//  Created by test on 09/06/24.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
        .toolbar {
            Button {
                let newTask = Task(title: "New Task")
//                tasks.append(newTask)
                tasks.insert(newTask, at: 0)
            } label: {
                Label("Add New Task", systemImage: "plus")
            }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
