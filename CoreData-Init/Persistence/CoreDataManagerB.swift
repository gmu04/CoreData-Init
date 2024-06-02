// CoreDataManagerB.swift by Gokhan Mutlu on 2.06.2024

import Foundation
import CoreData

final class CoreDataManagerB{
	
	private let container:NSPersistentContainer
	private let modelName = "DemoModel"
	
	var viewContext:NSManagedObjectContext{
		container.viewContext
	}

	init() {
		self.container = NSPersistentContainer(name:modelName)
		container.loadPersistentStores { persistentStoreDescription, error in
			if let err = error{
				fatalError("Core Data not initialized!\n\(err.localizedDescription)")
			}
		}
	}
}
