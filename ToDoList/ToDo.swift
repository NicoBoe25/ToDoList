//
//  ToDo.swift
//  ToDoList
//
//  Created by holcvart corentin on 04/01/2021.
//  Copyright © 2021 boehrer nicolas. All rights reserved.
//

import UIKit
import CoreLocation


class ToDo: NSObject {
    var title: String
    var state: Bool
    var photo: UIImage?
    var updateDate: Date?
    var locationEnabled: Bool
    var local: CLLocation?
    
    init(title:String, state:Bool, updateDate: Date?, locationEnabled: Bool?, local: CLLocation?, photo: UIImage?) {
        self.title = title;
        self.state = state;
        if let updateDate = updateDate{
            self.updateDate = updateDate
        }
        if let locationEnabled = locationEnabled {
            self.locationEnabled = locationEnabled
        }else { self.locationEnabled = false }
        if let local = local {
            self.local = local
        }else { self.local = nil }
        
        self.photo=photo
    }
    
    static func loadSampleToDos() -> Array<ToDo>{
        let todo1:ToDo = ToDo(title: "courses", state: false, updateDate: Date(), locationEnabled: true, local: CLLocation(latitude: 47.642820, longitude: 6.839489),photo: nil);
        let todo2:ToDo = ToDo(title: "répondre à Nicolas", state: false, updateDate: Date(), locationEnabled: false, local: CLLocation(latitude: 47.5, longitude: 6.7680),photo: nil);
        let todo3:ToDo = ToDo(title: "Réparer la roue", state: false, updateDate: Date(), locationEnabled: nil, local: CLLocation(latitude: 64.133964, longitude: -21.925700),photo: nil);
        return [todo1, todo2, todo3];
    }
    
    

}
