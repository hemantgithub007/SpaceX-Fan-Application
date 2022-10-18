//
//  UpcomingModel.swift
//  SpaceXFanApplication
//
//  Created by hemant kumar on 18/10/22.
//


import Foundation

// MARK: - UpcomingModel

    
    struct UpcomingModel: Codable {
        let fairings: Fairings
        let links: Links
        let staticFireDateUTC, staticFireDateUnix: String?
        let net: Bool
        let window: String
        let rocket: Rocket
        let success: String
        let failures: [String]
        let details: String
        let crew, ships, capsules: [String]
        let payloads: [String]
        let launchpad: Launchpad
        let flightNumber: Int
        let name, dateUTC: String
        let dateUnix: Int
        let dateLocal: Date
        let datePrecision: DatePrecision
        let upcoming: Bool
        let cores: [Core]
        let autoUpdate, tbd: Bool
        let launchLibraryID: String
        let id: String

        enum CodingKeys: String, CodingKey {
            case fairings, links
            case staticFireDateUTC
            case staticFireDateUnix
            case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
            case flightNumber
            case name
            case dateUTC
            case dateUnix
            case dateLocal
            case datePrecision
            case upcoming, cores
            case autoUpdate
            case tbd
            case launchLibraryID
            case id
        }
    }

    // MARK: - Core
    struct Core: Codable {
        let core: String
        let flight: Int
        let gridfins, legs, reused: Bool?
        let landingAttempt, landingSuccess, landingType, landpad: String?

        enum CodingKeys: String, CodingKey {
            case core, flight, gridfins, legs, reused
            case landingAttempt
            case landingSuccess
            case landingType
            case landpad
        }
    }

    enum DatePrecision: String, Codable {
        case day = "day"
        case hour = "hour"
        case month = "month"
    }

    // MARK: - Fairings
    struct Fairings: Codable {
        let reused, recoveryAttempt, recovered: String?
        let ships: [String]

        enum CodingKeys: String, CodingKey {
            case reused
            case recoveryAttempt
            case recovered, ships
        }
    }

    enum Launchpad: String, Codable {
        case the5E9E4501F509094Ba4566F84 = "5e9e4501f509094ba4566f84"
        case the5E9E4502F509092B78566F87 = "5e9e4502f509092b78566f87"
        case the5E9E4502F509094188566F88 = "5e9e4502f509094188566f88"
    }

    // MARK: - Links
    struct Links: Codable {
        let patch: Patch
        let reddit: Reddit
        let flickr: Flickr
        let presskit: String
        let webcast: String
        let youtubeID: String
        let article, wikipedia: String

        enum CodingKeys: String, CodingKey {
            case patch, reddit, flickr, presskit, webcast
            case youtubeID
            case article, wikipedia
        }
    }

    // MARK: - Flickr
    struct Flickr: Codable {
        let small, original: [String]
    }

    // MARK: - Patch
    struct Patch: Codable {
        let small, large: String?
    }

    // MARK: - Reddit
    struct Reddit: Codable {
        let campaign: String
        let launch, media: String
        let recovery: String
    }

    enum Rocket: String, Codable {
        case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
        case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"
    }
//
//    typealias Welcome = [UpcomingModel]
//
//    // MARK: - Encode/decode helpers
//
//    class JSONNull: Codable, Hashable {
//
//        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//        }
//
//        public var hashValue: Int {
//            return 0
//        }
//
//        public init() {}
//
//        public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//        }
//
//        public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//        }
//    }
//
//    class JSONCodingKey: CodingKey {
//        let key: String
//
//        required init?(intValue: Int) {
//            return nil
//        }
//
//        required init?(stringValue: String) {
//            key = stringValue
//        }
//
//        var intValue: Int? {
//            return nil
//        }
//
//        var stringValue: String {
//            return key
//        }
//    }
//
//    class JSONAny: Codable {
//
//        let value: Any
//
//        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//            return DecodingError.typeMismatch(JSONAny.self, context)
//        }
//
//        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//            return EncodingError.invalidValue(value, context)
//        }
//
//        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                return value
//            }
//            if let value = try? container.decode(Double.self) {
//                return value
//            }
//            if let value = try? container.decode(String.self) {
//                return value
//            }
//            if container.decodeNil() {
//                return JSONNull()
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//        }
//
//        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                return value
//            }
//            if let value = try? container.decode(Double.self) {
//                return value
//            }
//            if let value = try? container.decode(String.self) {
//                return value
//            }
//            if let value = try? container.decodeNil() {
//                if value {
//                    return JSONNull()
//                }
//            }
//            if var container = try? container.nestedUnkeyedContainer() {
//                return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//                return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//        }
//
//        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//            if let value = try? container.decode(Bool.self, forKey: key) {
//                return value
//            }
//            if let value = try? container.decode(Int64.self, forKey: key) {
//                return value
//            }
//            if let value = try? container.decode(Double.self, forKey: key) {
//                return value
//            }
//            if let value = try? container.decode(String.self, forKey: key) {
//                return value
//            }
//            if let value = try? container.decodeNil(forKey: key) {
//                if value {
//                    return JSONNull()
//                }
//            }
//            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//                return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//                return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//        }
//
//        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//            var arr: [Any] = []
//            while !container.isAtEnd {
//                let value = try decode(from: &container)
//                arr.append(value)
//            }
//            return arr
//        }
//
//        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//            var dict = [String: Any]()
//            for key in container.allKeys {
//                let value = try decode(from: &container, forKey: key)
//                dict[key.stringValue] = value
//            }
//            return dict
//        }
//
//        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//            for value in array {
//                if let value = value as? Bool {
//                    try container.encode(value)
//                } else if let value = value as? Int64 {
//                    try container.encode(value)
//                } else if let value = value as? Double {
//                    try container.encode(value)
//                } else if let value = value as? String {
//                    try container.encode(value)
//                } else if value is JSONNull {
//                    try container.encodeNil()
//                } else if let value = value as? [Any] {
//                    var container = container.nestedUnkeyedContainer()
//                    try encode(to: &container, array: value)
//                } else if let value = value as? [String: Any] {
//                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                    try encode(to: &container, dictionary: value)
//                } else {
//                    throw encodingError(forValue: value, codingPath: container.codingPath)
//                }
//            }
//        }
//
//        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//            for (key, value) in dictionary {
//                let key = JSONCodingKey(stringValue: key)!
//                if let value = value as? Bool {
//                    try container.encode(value, forKey: key)
//                } else if let value = value as? Int64 {
//                    try container.encode(value, forKey: key)
//                } else if let value = value as? Double {
//                    try container.encode(value, forKey: key)
//                } else if let value = value as? String {
//                    try container.encode(value, forKey: key)
//                } else if value is JSONNull {
//                    try container.encodeNil(forKey: key)
//                } else if let value = value as? [Any] {
//                    var container = container.nestedUnkeyedContainer(forKey: key)
//                    try encode(to: &container, array: value)
//                } else if let value = value as? [String: Any] {
//                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                    try encode(to: &container, dictionary: value)
//                } else {
//                    throw encodingError(forValue: value, codingPath: container.codingPath)
//                }
//            }
//        }
//
//        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//
//        public required init(from decoder: Decoder) throws {
//            if var arrayContainer = try? decoder.unkeyedContainer() {
//                self.value = try JSONAny.decodeArray(from: &arrayContainer)
//            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//                self.value = try JSONAny.decodeDictionary(from: &container)
//            } else {
//                let container = try decoder.singleValueContainer()
//                self.value = try JSONAny.decode(from: container)
//            }
//        }
//
//        public func encode(to encoder: Encoder) throws {
//            if let arr = self.value as? [Any] {
//                var container = encoder.unkeyedContainer()
//                try JSONAny.encode(to: &container, array: arr)
//            } else if let dict = self.value as? [String: Any] {
//                var container = encoder.container(keyedBy: JSONCodingKey.self)
//                try JSONAny.encode(to: &container, dictionary: dict)
//            } else {
//                var container = encoder.singleValueContainer()
//                try JSONAny.encode(to: &container, value: self.value)
//            }
//        }
//    }
