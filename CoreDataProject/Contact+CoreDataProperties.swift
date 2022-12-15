//
//  Contact+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by jiwon Yoon on 2022/12/15.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var shortcutNumber: Int16

}

extension Contact : Identifiable {

}
