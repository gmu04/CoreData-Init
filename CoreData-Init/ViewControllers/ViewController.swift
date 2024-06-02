// ViewController.swift by Gokhan Mutlu on 25.05.2024

import UIKit
import CoreData

class ViewController: UIViewController {

	#warning("Better to use managed-object context in ViewModels, or in Data Layer.")
	//following line is for demo purpose.
	private var viewContext:NSManagedObjectContext!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("ViewController.\(#function)")
		print(String(repeating: "---- ", count: 5))

		initCoreData_story_1of2()
		initCoreData_story_2of2_A()
		initCoreData_story_2of2_B()
	}

	/*
	 Story: Core Data — 1/2 — Initialization
	 https://medium.com/@gokhanmutlu/core-data-1-2-initialization-144d72858a69
	 */
	private func initCoreData_story_1of2(){
		
		let coredataManager = CoreDataManager()
		self.viewContext = coredataManager.viewContext
		
		printViewContext()
	}
	
	
	/*
	 Story: Core Data - 2/2 - Initialization with NSPersistentContainer
	 https://medium.com/@gokhanmutlu/core-data-2-2-initialization-with-nspersistentcontainer-bee877b82e18
	 */
	private func initCoreData_story_2of2_A(){
		let coredataManager = CoreDataManagerB()
		self.viewContext = coredataManager.viewContext
		printViewContext()
	}

	
	/*
	 Story: Core Data - 2/2 - Initialization with NSPersistentContainer
	 Use In-Memory storage
	 https://medium.com/@gokhanmutlu/core-data-2-2-initialization-with-nspersistentcontainer-bee877b82e18
	 */
	private func initCoreData_story_2of2_B(){
		
		//In-Memory storage
		let coredataManagerWithInMemoryStorage = CoreDataManagerB.managerWithInMemoryStorage
		self.viewContext = coredataManagerWithInMemoryStorage.viewContext
		
		printViewContext()
		
		//show preview items
		let itemsRequest: NSFetchRequest<Item> = Item.fetchRequest()
		do {
			let items = try self.viewContext.fetch(itemsRequest)
			for item in items{
				print(item)
			}
		} catch let err as NSError {
			print(err)
		}
	}
	
	
	
	private func printViewContext(){
		guard let context = self.viewContext else{ return }
		print(context)
		print("Core Data - ViewContext created\nHappy Coding 🐝")
		print(String(repeating: "---- ", count: 5))
	}
	
}

