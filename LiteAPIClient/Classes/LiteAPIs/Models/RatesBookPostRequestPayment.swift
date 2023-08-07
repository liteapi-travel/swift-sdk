//
// RatesBookPostRequestPayment.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RatesBookPostRequestPayment: Codable, JSONEncodable, Hashable {

    public enum Method: String, Codable, CaseIterable {
        case creditCard = "CREDIT_CARD"
        case stripeToken = "STRIPE_TOKEN"
    }
    public var holderName: String
    public var number: String?
    public var expireDate: String?
    public var cvc: String?
    public var method: Method
    public var token: String?

    public init(holderName: String, number: String? = nil, expireDate: String? = nil, cvc: String? = nil, method: Method, token: String? = nil) {
        self.holderName = holderName
        self.number = number
        self.expireDate = expireDate
        self.cvc = cvc
        self.method = method
        self.token = token
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case holderName
        case number
        case expireDate
        case cvc
        case method
        case token
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(holderName, forKey: .holderName)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(expireDate, forKey: .expireDate)
        try container.encodeIfPresent(cvc, forKey: .cvc)
        try container.encode(method, forKey: .method)
        try container.encodeIfPresent(token, forKey: .token)
    }
}

