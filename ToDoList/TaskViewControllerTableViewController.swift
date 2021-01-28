//
//  TaskViewControllerTableViewController.swift
//  ToDoList
//
//  Created by boehrer nicolas on 04/01/2021.
//  Copyright © 2021 boehrer nicolas. All rights reserved.
//

import UIKit

class TaskViewControllerTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet var todoTableView: UITableView!
    var tabTask = ToDo.loadSampleToDos();

    @IBOutlet weak var newTaskTextField: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        if newTaskTextField.hasText {
            let newNameTask = newTaskTextField.text!
            tabTask.append(ToDo(title: newNameTask, state: false, updateDate: Date(), locationEnabled: false, local: nil, photo: nil))
            todoTableView.reloadData();
        }else{
            let alert = UIAlertController(title: "ToDo", message: "Task is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        newTaskTextField.resignFirstResponder()
        newTaskTextField.text=nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTaskTextField.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tabTask.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskID", for: indexPath) as! CellTableViewCell
        let task = tabTask[indexPath.row]
        cell.toDo = task
        cell.cellLabel.text=task.title
        cell.cellButton.addTarget(self, action: #selector(buttonTapped) , for: .touchUpInside)
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let cell = sender.superview!.superview! as! CellTableViewCell
        cell.toDo.state = !cell.toDo.state
        sender.isSelected = !sender.isSelected
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // Delete the row from the data source
            let cell = tableView.cellForRow(at: indexPath) as! CellTableViewCell
            if cell.toDo.state{
                tabTask.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }else{
                let alert = UIAlertController(title: "ToDo", message: "Task is not checked", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    @IBAction func unwindToNoteTableView(segue: UIStoryboardSegue) {
                 let sourceViewController = segue.source as! TaskViewController
                 if let todo = sourceViewController.task {
                     if let selectedIndexPath = tableView.indexPathForSelectedRow {
                         tabTask[selectedIndexPath.row] = todo
                         tableView.reloadRows(at: [selectedIndexPath], with: .fade)
                     }
                 }
         }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let selectedTask = tabTask[selectedIndexPath.row]
        let navigationController = segue.destination as! UINavigationController
        let taskViewController = navigationController.topViewController as! TaskViewController
        taskViewController.task = selectedTask
    }
}
