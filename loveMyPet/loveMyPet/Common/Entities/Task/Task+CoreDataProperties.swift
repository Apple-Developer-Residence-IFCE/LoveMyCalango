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
    @NSManaged public var replayValue: String?
    @NSManaged public var reminderValue: String?
    @NSManaged public var summary: String?
    @NSManaged public var petName: String?
    @NSManaged public var pet: Pet?
    
    var type: TaskType {
        get {
            return TaskType(rawValue: typeValue ?? "") ?? .none
        }
        set {
            typeValue = newValue.rawValue
        }
    }
    
    var replay: Replay {
        get {
            return Replay(rawValue: replayValue ?? "") ?? .never
        }
        set {
            replayValue = newValue.rawValue
        }
    }
    
    var reminder: Reminder {
        get {
            return Reminder(rawValue: reminderValue ?? "") ?? .none
        }
        set {
            reminderValue = newValue.rawValue
        }
    }

}

extension Task : Identifiable {

}
