// ViewController.swift by Gokhan Mutlu on 25.05.2024

import UIKit
import CoreData

class ViewController: UIViewController {

	//for demo purpose: Better to use viewContext in ViewModels or Data Layer
	private var viewContext:NSManagedObjectContext!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("ViewController.\(#function)")
		
		initCoreData()
		printViewContext()
	}

	private func initCoreData(){
		print(String(repeating: "---- ", count: 5))
		
		/*
		 Story: Core Data — 1/2 — Initialization
		 https://medium.com/@gokhanmutlu/core-data-1-2-initialization-144d72858a69
		 */
		//let coredataManager = CoreDataManager()
		//self.viewContext = coredataManager.viewContext
		
		/*
		 Story: Core Data - 2/2 - Initialization with NSPersistentContainer
		 	
		 */
		let coredataManager = CoreDataManagerB()
		self.viewContext = coredataManager.viewContext
	}
	
	private func printViewContext(){
		guard let context = self.viewContext else{ return }
		print(context)
		print("Core Data - ViewContext created\nHappy Coding 🐝")
		print(String(repeating: "---- ", count: 5))
	}
	
}

