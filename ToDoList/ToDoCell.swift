//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Михаил on 25/03/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    private var taskNameLabel = UILabel()
    private var countOfSubTasks = UILabel()
    private(set) var cellTask: Task!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setNeedsUpdateConstraints()
    }
    
    
    private func setupUI() {
        taskNameLabel.textColor = .black
        taskNameLabel.numberOfLines = 1
        taskNameLabel.font = UIFont(name: "System", size: 14)
        countOfSubTasks.textColor = .gray
        countOfSubTasks.numberOfLines = 1
        countOfSubTasks.font = UIFont(name: "System", size: 14)
        self.contentView.addSubview(taskNameLabel)
        self.contentView.addSubview(countOfSubTasks)
    }
    
    func getTask() -> Task {
        return self.cellTask
    }
    
    
    func setupCell(task: Task) {
        self.cellTask = task
        taskNameLabel.text = task.name
        countOfSubTasks.text = String(task.subTasks.count)
    }
    
    override func updateConstraints() {
        
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        taskNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        taskNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        countOfSubTasks.translatesAutoresizingMaskIntoConstraints = false
        countOfSubTasks.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        countOfSubTasks.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        super.updateConstraints()
    }
}
