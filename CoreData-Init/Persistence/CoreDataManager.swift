// CoreDataManager.swift by Gokhan Mutlu on 25.05.2024

import Foundation
import CoreData

final class CoreDataManager{
	init() { }
	
	// MARK: Properties
	
	private let modelName = "DemoModel"
	
	private lazy var managedObjectModel:NSManagedObjectModel = {
		let coreDataModelName = modelName
		let coreDataModelExtension = "momd"
		
		guard let url = Bundle.main.url(forResource: coreDataModelName, withExtension: coreDataModelExtension) else{
			fatalError("Core Data Model file not found: \(modelName).momd")
		}
		
		guard let model = NSManagedObjectModel(contentsOf: url) else{
			fatalError("Failed to load model")
		}
		
		return model
	}()
	
	
	private lazy var persistentStoreCoordinator:NSPersistentStoreCoordinator = {
		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
		
		//sqlite file for coordinator
		let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
		let sqliteFileName = "\(modelName).sqlite"
		let sqlitePath = documentDirectory.appending(path: sqliteFileName)
		
		do{
			let _ = try coordinator.addPersistentStore(type: .sqlite, configuration: nil, at: sqlitePath, options: nil)
		}catch{
			fatalError("Failed to create coordinator")
		}
		
		return coordinator
	}()
	
	
	//MARK: - NSManagedObjectContext
	
	lazy var viewContext:NSManagedObjectContext = {
		let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
		context.persistentStoreCoordinator = persistentStoreCoordinator
		return context
	}()
	
	
}
