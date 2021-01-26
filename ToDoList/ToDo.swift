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
    
    init(title:String, state:Bool) {
        self.title = title;
        self.state = state;
    }
    
    static func loadSampleToDos() -> Array<ToDo>{
        let todo1:ToDo = ToDo(title: "courses", state: false);
        let todo2:ToDo = ToDo(title: "répondre à Nicolas", state: false);
        let todo3:ToDo = ToDo(title: "Réparer la roue", state: false);
        
        return [todo1, todo2, todo3];
    }
    
    

}
