//
//  ViewController.swift
//  ToDoList
//
//  Created by Шынар Торехан on 28/06/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit
var toDoList: [[ToDoTask]] = [[],[],[]]
var p = 0
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setEditing(true, animated: true)
        self.tableView.isEditing = !self.tableView.isEditing //here
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) { //viewdidappear
        tableView.reloadData()
    }

    @IBOutlet weak var taskStates: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func chooseTaskState(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == "Undone" {
            toDoList[2] = []
            for obj0 in toDoList[0]{
                for obj1 in toDoList[1]{
                    if obj0.title !=  obj1.title{
                        toDoList[2].append(obj0)
                    }
                }
            }
//            for i in 0...toDoList[2].count{
//                tableView.cellForRow(at: indexp)?.accessoryType = UITableViewCellAccessoryType.none
//            }
            
        }
        tableView.reloadData()
    }
    @IBAction func editting(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList[p].count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            toDoList[1].append(toDoList[0][indexPath.row])
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.taskLabel?.text = toDoList[p][indexPath.row].title
        cell.dateLabel?.text = toDoList[p][indexPath.row].date
        cell.imgView.image = UIImage(named: toDoList[p][indexPath.row].category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            toDoList[p].remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        toDoList[p].insert(toDoList[p].remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
        tableView.reloadData()
    }
}

