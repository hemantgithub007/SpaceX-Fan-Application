//
//  RocketDataViewModel.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 04/10/22.
//

import Foundation
// MARK: RocketDataViewModel
class RocketDataViewModel {
    var rocketData = [RocketDataModel]()
    // Method for calling the API for Rocket Data
    func getRocketDataFromAPI(completion: @escaping ([RocketDataModel]) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
            debugPrint("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            // While error is not there
            if error == nil {
                // Check data is available or not
                if let apiData = data {
                    do {
                        let rocketData = try? JSONDecoder().decode([RocketDataModel].self, from: apiData)
                        // Check data is decoded successfully or not
                        guard let rocketDataFromAPI = rocketData else {
                            debugPrint("Roket Data not found!!, try Again")
                            return
                        }
                        // Send completion using main thread
                        DispatchQueue.main.async {
                            completion(rocketDataFromAPI)
                        }
                    }
                } else {
                    debugPrint("Data from API not Found!!")
                }
            } else {
                debugPrint("Something went wrong with API to fetch the data from API")
            }
        }.resume()
    }
    
    
    
}
