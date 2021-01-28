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
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false

        if let task = task{
            titleInput.text = task.title
            let formatter3 = DateFormatter()
            formatter3.dateFormat = "dd/MM/yyyy, H:m"
            dateLabel.text = formatter3.string(from: task.updateDate!)
            imagImageView.image=task.photo
            locationSwitch.setOn(task.locationEnabled, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    func updateSaveButtonState(){
            let title = titleInput.text ?? ""
            saveButton.isEnabled = !title.isEmpty
        }

        @IBAction func textEditingChanged(_ sender: UITextField) {
            updateSaveButtonState()
        }
    
    @IBAction func dismissDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if saveButton.isEnabled {
                   let title = titleInput.text!
                   
                   //let local = currentUserLocation
                   
                   //let photo = imageView.image
                   
            task = ToDo(title: title, state: false, updateDate: Date()/*, local: local ?? CLLocation(latitude: 47.6, longitude: 6.8), photo: photo*/ )
               }
    }
    

}
