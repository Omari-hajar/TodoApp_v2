//
//  Todo+CoreDataProperties.swift
//  TodoApp_v2
//
//  Created by Hajar Alomari on 15/12/2021.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var isChecked: Bool

}

extension Todo : Identifiable {

}
