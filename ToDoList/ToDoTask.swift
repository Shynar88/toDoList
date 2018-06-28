//
//  toDoTask.swift
//  ToDoList
//
//  Created by Шынар Торехан on 28/06/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import Foundation

struct ToDoTask{
    let category: String
    let title: String
    let date: String
    
    init(category: String, title: String, date: String){
        self.category = category
        self.title = title
        self.date = date
    }
}
