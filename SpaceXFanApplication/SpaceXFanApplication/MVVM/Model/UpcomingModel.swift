//
//  UpcomingModel.swift
//  SpaceXFanApplication
//
//  Created by hemant kumar on 18/10/22.
//


import Foundation

// MARK: - UpcomingModel
struct UpcomingRocketDataModel: Codable {
    
    let fairings: Fairings?
    let name: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case fairings
        case name
    }
    
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: String?
    let ships: [String]?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt
        case recovered
        case ships
    }
}
    
