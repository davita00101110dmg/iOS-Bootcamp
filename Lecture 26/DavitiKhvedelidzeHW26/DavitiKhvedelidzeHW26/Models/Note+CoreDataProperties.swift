//
//  Note+CoreDataProperties.swift
//  DavitiKhvedelidzeHW26
//
//  Created by Dato Khvedelidze on 25.08.22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var name: String?

}

extension Note : Identifiable {

}
