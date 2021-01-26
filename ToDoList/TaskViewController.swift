//
//  TaskViewController.swift
//  ToDoList
//
//  Created by holcvart corentin on 04/01/2021.
//  Copyright © 2021 boehrer nicolas. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    var task: ToDo?

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imagImageView: UIImageView!
    @IBOutlet weak var locationSwitch: UISwitch!
    
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let task = task{
            titleInput.text = task.title
//            dateLabel.text = task.lastDate
            imagImageView.image=task.photo
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
