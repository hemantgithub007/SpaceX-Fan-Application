//
//  DatabaseHelper.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 05/10/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        let entityName = NSEntityDescription.insertNewObject(forEntityName: "FavouriteRocketData", into: context) as! FavouriteRocketData
        entityName.id = object["id"]
        do{
            try context.save()
            print("save")

        }catch{
            print("Data not save")
        }
        
    }
    
    
    
    func deleteData(indexs : Int, idString: String) -> [FavouriteRocketData] {
        
        var student = getAllData()
        print("out of bond: ",student.count )
        context.delete(student[indexs])
//        student.remove(at: indexs)
        student.removeAll(where: { $0.id == idString })
        
        do{
        
            try context.save()
             }
        catch{
            print("Data do not move")
        }
        
        return student
    }
    
    func getAllData() -> [FavouriteRocketData]{
        var student:[FavouriteRocketData] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteRocketData")
        do{
            student = try context.fetch(fetchRequest) as! [FavouriteRocketData]
        }catch{
            print("Not get data")
        }
        return student
    }
    
    
    
    
    
    
    
}
