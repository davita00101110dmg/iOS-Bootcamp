//
//  CoreDataHelper.swift
//  DavitiKhvedelidzeHW26
//
//  Created by Dato Khvedelidze on 28.08.22.
//

import UIKit

// Reference to managed object context
public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

// Save the data
public func saveData() {
    do {
        try context.save()
    } catch {
        print(error.localizedDescription)
    }
}
