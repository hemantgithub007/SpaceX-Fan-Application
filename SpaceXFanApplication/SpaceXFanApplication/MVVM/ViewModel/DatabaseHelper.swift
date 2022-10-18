//
//  DatabaseHelper.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 05/10/22.
//

import UIKit
import Foundation
import CoreData
import AVFoundation
import Photos

//...............................Core Data.............................
class DatabaseHelper{
    
    
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    //..............Save Data...............
    
    func save(object:[String:String]){
        let entityName = NSEntityDescription.insertNewObject(forEntityName: "FavouriteRocketData", into: context) as! FavouriteRocketData
        entityName.id = object["id"]
        entityName.rocketdetails = object["rocketdetails"]
        entityName.rocketImage = object["rocketImage"]
        entityName.rocketName = object["rocketName"]


        do{
            try context.save()
            print("save")

        }catch{
            print("Data not save")
        }
        
    }
    
    
    //........... check Record is exsist in table or not.............
    
    func someEntityExists_H(userId: String) -> Bool {
        var result = Bool()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteRocketData")
        let predicate = NSPredicate(format: "id == %@", userId)
        request.predicate = predicate
        request.fetchLimit = 1
        
        do{
            let count = try context.count(for: request)
            if(count == 0){
                // no matching object
                result = false
            }
            else{
                // at least one matching object exists
                result = true

            }
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    
    // ..............Fetch Data.........................
    
    func fetchAllData() -> [FavouriteRocketData]{
        var student:[FavouriteRocketData] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteRocketData")
        do{
            student = try context.fetch(fetchRequest) as! [FavouriteRocketData]
        }catch{
            print("Not get data")
        }
        return student
    }
    
    
    // ..............Delete Data.........................

    func deleteData(idString: String) {
        
//        var student = fetchAllData()
//        print("out of bond: ",student.count )
//        student.removeAll(where: { $0.id == idString })
//
//        do{
//
//            try context.save()
//             }
//        catch{
//            print("Data do not move")
//        }
        
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteRocketData")
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)

        do
        {
            let test = try managedContext.fetch(fetchRequest)

            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)

            do{
                try managedContext.save()

            
                print("Delete Successfully")

            }
            catch
            {
                print(error)
            }

        }
        catch
        {
            print(error)
        }
        
        
        
        
        
    }
    
  
    
    
    
    
    
    
}
