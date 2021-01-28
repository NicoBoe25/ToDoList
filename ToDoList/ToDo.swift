//
//  ToDo.swift
//  ToDoList
//
//  Created by holcvart corentin on 04/01/2021.
//  Copyright © 2021 boehrer nicolas. All rights reserved.
//

import UIKit

class ToDo: NSObject {
    var title: String
    var state: Bool
    var photo: UIImage?
    var updateDate: Date?
    var locationEnabled: Bool
    
    init(title:String, state:Bool, updateDate: Date?, locationEnabled: Bool?) {
        self.title = title;
        self.state = state;
        if let updateDate = updateDate{
            self.updateDate = updateDate
        }
        if let locationEnabled = locationEnabled {
            self.locationEnabled = locationEnabled
        }else { self.locationEnabled = false }
    }
    
    static func loadSampleToDos() -> Array<ToDo>{
        let todo1:ToDo = ToDo(title: "courses", state: false, updateDate: Date(), locationEnabled: true);
        let todo2:ToDo = ToDo(title: "répondre à Nicolas", state: false, updateDate: Date(), locationEnabled: false);
        let todo3:ToDo = ToDo(title: "Réparer la roue", state: false, updateDate: Date(), locationEnabled: nil);
        return [todo1, todo2, todo3];
    }
    
    

}
