//
//  Task+CoreDataProperties.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 29/06/23.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var typeValue: String?
    @NSManaged public var date: Date?
    @NSManaged public var repeatValue: String?
    @NSManaged public var reminderValue: String?
    @NSManaged public var summary: String?
    @NSManaged public var petName: String?
    @NSManaged public var pet: Pet?

}

extension Task : Identifiable {

}
