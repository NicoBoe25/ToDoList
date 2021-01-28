//
//  TaskViewController.swift
//  ToDoList
//
//  Created by holcvart corentin on 04/01/2021.
//  Copyright © 2021 boehrer nicolas. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TaskViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate{
    
    var task: ToDo?
    let locationManager = CLLocationManager()
    var tempLocation: CLLocation?
    var currentUserLocation: CLLocation!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imagImageView: UIImageView!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
                //locationManager.startUpdatingHeading()
            }
        }

        if let task = task{
            titleInput.text = task.title
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy, HH:mm"
            dateLabel.text = formatter.string(from: task.updateDate!)
            imagImageView.image=task.photo
            locationSwitch.setOn(task.locationEnabled, animated: true)
            if task.locationEnabled {
                if let location = task.local {
                    let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
                    map.setRegion(mRegion, animated: true)
                    
                    let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
                    mkAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    mkAnnotation.title = task.title
                    map.addAnnotation(mkAnnotation)
                }
            }
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = locationManager.location
    }
    
    @IBAction func setPhotoOnClick(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = false
         
        self.present(pickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imagImageView.image = originalImage
        }else {
            print("Erreur Image t'es nul")
        }
        
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
            let photo = imagImageView.image
            var local: CLLocation? = nil
            if locationSwitch.isOn {
                local = currentUserLocation
            }
            //print("location tsk latitude: " + String(task!.local!.coordinate.latitude))
            task = ToDo(title: title, state: false, updateDate: Date(), locationEnabled: locationSwitch.isOn, local: local, photo: photo)
            
        }
    }
}
