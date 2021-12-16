//
//  TaskDelegate.swift
//  TodoApp_v2
//
//  Created by Hajar Alomari on 15/12/2021.
//

import UIKit


protocol TaskDelegate: AnyObject {
    
    func fetchData()
    func addTask(controller: AddViewController ,title: String, details: String, date: Date, isChecked: Bool, indexPath: NSIndexPath?)
    

}
