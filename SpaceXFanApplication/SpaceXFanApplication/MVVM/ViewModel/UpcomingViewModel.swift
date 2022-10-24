//
//  UpcomingViewModel.swift
//  SpaceXFanApplication
//
//  Created by hemant kumar on 19/10/22.
//

import Foundation
import UIKit
import MobileCoreServices


//..................Another way of Api Calling..........................

final class NetworkManagerBlock {
    
    let baseURL = "https://api.spacexdata.com/v4/"
    var params:Dictionary = Dictionary<String,Any>()
    var responseData =  Dictionary<String,Any>()
    
    func fetchData(withUrl apiName:String, completionHandler: @escaping (Any) -> Void) {
     let url = URL(string: baseURL + apiName)!
     print(url)
     var request = URLRequest(url: url)
     request.httpMethod = "GET"
     request.setValue("application/json", forHTTPHeaderField:"Content-Type")
     for (key,value) in params {
     let result_string = "\(value)"
     request.addValue(result_string , forHTTPHeaderField: key)
    }
        
    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        let errorMsg = "Something went wrong please try again!"
        completionHandler(errorMsg)
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
        let errorMsg = "Something went wrong please try again!"
        completionHandler(errorMsg)
        return
      }
          if let data = data,
          let jsonResults = try? JSONSerialization.jsonObject(with: data, options: []) as? Any {
              completionHandler(jsonResults)
           }
        })
    task.resume()
  }

}
