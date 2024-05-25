// ViewController.swift by Gokhan Mutlu on 25.05.2024

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		print("ViewController.\(#function)")
		
		initCoreDataAndPrintViewContext()
	}

	private func initCoreDataAndPrintViewContext(){
		print(String(repeating: "---- ", count: 5))
		let coredataManager = CoreDataManager()
		let context = coredataManager.viewContext
		print(context)
		
		print("Core Data - ViewContext created\nHappy Coding 🐝")
		print(String(repeating: "---- ", count: 5))
	}
}

