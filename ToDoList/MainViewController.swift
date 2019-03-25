//
//  ViewController.swift
//  ToDoList
//
//  Created by Михаил on 25/03/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    private var tableView: UITableView!
    private var rightBarButtonItem: UIBarButtonItem!
    private var leftBarButtonItem: UIBarButtonItem!
    
    private var mainTask: Task!
    private var arrayOfSubTasks: [Task] = []
    
    private var newTaskName: String?

    override func viewDidLoad() {
       // self.restorationIdentifier = "mainViewController"
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    private func setupUI() {
        self.setupMainTask()
        self.setupTableView()
        self.setupNavigationBar()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .gray
        tableView.register(ToDoCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }
    
    private func setupMainTask() {
        mainTask = ToDoTask(name: "Ваши задачи", parentTask: nil)
    }
    
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.topItem?.title = mainTask?.name
        rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTask))
        leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(showMainTask))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc private func addTask() {
        self.showAddSubTaskView()
    }
    
    @objc private func showMainTask() {
        guard let mainTaskGuard = mainTask?.parentTask else {return}
        mainTask = mainTaskGuard
        navigationController?.navigationBar.topItem?.title = mainTask?.name
        self.tableView.reloadSections([0], with: UITableView.RowAnimation.right)
    }
    
    
    private func showAddSubTaskView() {
        let alert = UIAlertController(title: "Введите название задачи", message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.borderStyle = UITextField.BorderStyle.roundedRect
        }
        
        let alertAction = UIAlertAction(title: "Добавить", style: .default) { action in
            self.mainTask?.addSubTask(task: ToDoTask(name: alert.textFields?.first?.text ?? "error", parentTask: self.mainTask))
            self.tableView.reloadSections([0], with: UITableView.RowAnimation.middle)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = tableView.cellForRow(at: indexPath) as? ToDoCell
        mainTask = selectedRow?.getTask()
        navigationController?.navigationBar.topItem?.title = mainTask?.name
        self.tableView.reloadSections([0], with: UITableView.RowAnimation.left
        )
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTask?.subTasks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoCell
        cell.setupCell(task: mainTask.subTasks[indexPath.row])
        return cell
    }
}



