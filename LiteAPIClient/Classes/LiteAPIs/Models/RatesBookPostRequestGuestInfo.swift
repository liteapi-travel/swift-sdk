//
// RatesBookPostRequestGuestInfo.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RatesBookPostRequestGuestInfo: Codable, JSONEncodable, Hashable {

    /** traveler first name */
    public var guestFirstName: String
    /** traveler last name */
    public var guestLastName: String
    /** traveler email */
    public var guestEmail: String

    public init(guestFirstName: String, guestLastName: String, guestEmail: String) {
        self.guestFirstName = guestFirstName
        self.guestLastName = guestLastName
        self.guestEmail = guestEmail
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case guestFirstName
        case guestLastName
        case guestEmail
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(guestFirstName, forKey: .guestFirstName)
        try container.encode(guestLastName, forKey: .guestLastName)
        try container.encode(guestEmail, forKey: .guestEmail)
    }
}

