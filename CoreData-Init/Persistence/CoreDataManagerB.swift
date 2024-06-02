// CoreDataManagerB.swift by Gokhan Mutlu on 2.06.2024

import Foundation
import CoreData

final class CoreDataManagerB{
	
	private let container:NSPersistentContainer
	private let modelName = "DemoModel"
	
	var viewContext:NSManagedObjectContext{
		container.viewContext
	}
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: modelName)
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				/*
				 Typical reasons for an error here include:
				 * The parent directory does not exist, cannot be created, or disallows writing.
				 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
				 * The device is out of space.
				 * The store could not be migrated to the current model version.
				 */
				fatalError("Core Data not initialized. Unresolved error \(error), \(error.userInfo)")
			}
		})
		container.viewContext.automaticallyMergesChangesFromParent = true
	}
	
}


extension CoreDataManagerB{
	static var managerWithInMemoryStorage: CoreDataManagerB = {
		let coreDataManagerB = CoreDataManagerB(inMemory: true)
		
		//add 5 item objects to Item entity
		for _ in 0..<5 {
			let newItem = Item(context: coreDataManagerB.viewContext)
			newItem.timestamp = Date()
		}
		
		
		do {
			//save items
			try coreDataManagerB.viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		return coreDataManagerB
	}()

}
