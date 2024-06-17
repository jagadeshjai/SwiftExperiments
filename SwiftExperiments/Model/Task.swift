//
//  Task.swift
//  SwiftExperiments
//
//  Created by test on 09/06/24.
//

import Foundation


struct Task: Identifiable, Hashable {
    let id = UUID();
    var title: String;
    var isCompleted: Bool;
    var dueDate: Date;
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title;
        self.isCompleted = isCompleted;
        self.dueDate = dueDate;
        self.details = details;
    }
    
    
    static func example() -> Task {
        Task(title: "Buy milk", dueDate: Calendar.current.date(byAdding: .day,value: 2,to: Date())!) // Need to check why we need ! here?
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Here's to crazy ones"),
            Task(title: "The misfits, the rebels, the troublemakers", isCompleted: true),
            Task(title: "The round page in the swuale holes..", dueDate: Calendar.current.date(byAdding: .day,value: 1, to: Date())!),
            Task(title: "The ones who see things differently - they're not found of rules.."),
            Task(title: "You can quote them, disagree with them, glorify or vilify them"),
            Task(title: "But the only thing you can't do is ignore them because they change things...", isCompleted: false),
            Task(title: "They push the human race forword", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "And while some may see them as the crazy ones"),
            Task(title: "We see genius", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Task(title: "Because the onew who are crazy enough to think that they can change the world"),
            Task(title: "Are the ones who do.", isCompleted: false)
            
        ]
    }
}
