//
//  SideBarView.swift
//  SwiftExperiments
//
//  Created by test on 09/06/24.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var selection: TaskSection
    @Binding var userCreatedgroups: [TaskGroup]
    
    var body: some View {
        List(selection: $selection) { // Need to check why $ used here
            Section("Favorites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName)
                        .tag(selection) // Check what tag does
                }
            }

            Section("Your Groups") {
                ForEach($userCreatedgroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                    .tag(TaskSection.list(group))
                }
            }
        }

        .safeAreaInset(edge: .bottom){
            Button(action: {
                let newGroup: TaskGroup = TaskGroup(title: "New group")
                userCreatedgroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SideBarView(selection: .constant(.all), userCreatedgroups: .constant(TaskGroup.examples()))
        .listStyle(.sidebar)
}
