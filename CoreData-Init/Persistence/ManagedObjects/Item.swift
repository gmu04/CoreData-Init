// Item+CoreDataClass.swift by Gokhan Mutlu on 2.06.2024
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

}

extension Item {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
		return NSFetchRequest<Item>(entityName: "Item")
	}

	@NSManaged public var timestamp: Date?

}

extension Item : Identifiable {

}
