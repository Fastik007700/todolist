//
//  Task.swift
//  ToDoList
//
//  Created by Михаил on 25/03/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import Foundation


protocol Task {

    var name: String {get}
    
    var subTasks: [Task] {get}
    
    var parentTask: Task? {get}
    
    func addSubTask(task: Task)
}

class ToDoTask: Task {
    
    var parentTask: Task?
    
    var name: String
    
    var subTasks: [Task] = []
    
    init(name: String, parentTask: Task?) {
        self.name = name
        self.parentTask = parentTask
    }
    
    func addSubTask(task: Task) {
        self.subTasks.append(task)
    }
    
    
}
