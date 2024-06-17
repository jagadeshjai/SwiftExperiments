//
//  ContentView.swift
//  SwiftExperiments
//
//  Created by test on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCreatedGroup: [TaskGroup] = TaskGroup.examples()
    @State private var selection = TaskSection.all
    @State private var allTasks = Task.examples()
    
    var body: some View {
        VStack {
            NavigationSplitView {
                SideBarView(selection: $selection, userCreatedgroups: $userCreatedGroup)
            } detail: {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({
                        $0.isCompleted}))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isCompleted}))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
