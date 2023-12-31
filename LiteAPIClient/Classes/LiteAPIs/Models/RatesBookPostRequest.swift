//
// RatesBookPostRequest.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RatesBookPostRequest: Codable, JSONEncodable, Hashable {

    /** prebook id retrived from prebook response */
    public var prebookId: String
    public var guestInfo: RatesBookPostRequestGuestInfo
    public var payment: RatesBookPostRequestPayment?

    public init(prebookId: String, guestInfo: RatesBookPostRequestGuestInfo, payment: RatesBookPostRequestPayment? = nil) {
        self.prebookId = prebookId
        self.guestInfo = guestInfo
        self.payment = payment
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case prebookId
        case guestInfo
        case payment
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(prebookId, forKey: .prebookId)
        try container.encode(guestInfo, forKey: .guestInfo)
        try container.encodeIfPresent(payment, forKey: .payment)
    }
}

