//
//  FavouriteRocket+CoreDataProperties.swift
//  
//
//  Created by Vestel on 06/10/22.
//
//

import Foundation
import CoreData

// StudentNames

extension FavouriteRocketData
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteRocketData> {
        return NSFetchRequest<FavouriteRocketData>(entityName: "FavouriteRocketData")
    }

    @NSManaged public var id: String?
    @NSManaged public var rocketdetails: String?
    @NSManaged public var rocketImage: String?
    @NSManaged public var rocketName: String?


}
