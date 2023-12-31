//
// SearchAPI.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SearchAPI {


    /**
     Get cities list
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getMinimumRates(hotelIds: [String], checkin: String, checkout: String, currency: String, guestNationality: String, adults: Int, children: [String]? = nil, guestId: String? = nil, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        let hotelIdsString = hotelIds.joined(separator: ",")
        var childrenString = ""
        if let children = children {
            childrenString = children.joined(separator: ",")
        }
        hotelsGet(hotelIds: hotelIdsString, checkin: checkin, checkout: checkout, currency: currency, guestNationality: guestNationality, adults: adults, children: childrenString, guestId: guestId) { (response, error) in
            completion(response, error)
        }
    }

    /**
     hotel minimum rates availability
     
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func hotelsGet(hotelIds: String, checkin: String, checkout: String, currency: String, guestNationality: String, adults: Int, children: String? = nil, guestId: String? = nil, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return hotelsGetWithRequestBuilder(hotelIds: hotelIds, checkin: checkin, checkout: checkout, currency: currency, guestNationality: guestNationality, adults: adults, children: children, guestId: guestId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     hotel minimum rates availability
     - GET /hotels
     - **Hotel Minimum Rates API** is to search and return the minimum room rates that are available for a list of hotel ID's on the specified search dates.  For each hotel ID, the minimum room rate that is available is returned.  The API also has a built in loyalty rewards system. The system rewards return users who have made prior bookings.  If the search is coming from a known guest ID, the guest level is also returned along with pricing has more discounts.  If it is a new user, the guest ID will be generated at the time of the first confirmed booking.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func hotelsGetWithRequestBuilder(hotelIds: String, checkin: String, checkout: String, currency: String, guestNationality: String, adults: Int, children: String? = nil, guestId: String? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/hotels"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "hotelIds": (wrappedValue: hotelIds.encodeToJSON(), isExplode: true),
            "checkin": (wrappedValue: checkin.encodeToJSON(), isExplode: true),
            "checkout": (wrappedValue: checkout.encodeToJSON(), isExplode: true),
            "currency": (wrappedValue: currency.encodeToJSON(), isExplode: true),
            "guestNationality": (wrappedValue: guestNationality.encodeToJSON(), isExplode: true),
            "adults": (wrappedValue: adults.encodeToJSON(), isExplode: true),
            "children": (wrappedValue: children?.encodeToJSON(), isExplode: true),
            "guestId": (wrappedValue: guestId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }


    /**
     Get cities list
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */

    open class func getFullRates(hotelIds: [String], checkin: String, checkout: String, currency: String, guestNationality: String, adults: Int, children: [String]? = nil, guestId: String? = nil, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        let hotelIdsString = hotelIds.joined(separator: ",")
        var childrenString = ""
        if let children = children {
            childrenString = children.joined(separator: ",")
        }
        hotelsRatesGet(hotelIds: hotelIdsString, checkin: checkin, checkout: checkout, guestNationality: guestNationality, currency: currency,adults: adults, children: childrenString, guestId: guestId) { (response, error) in
            completion(response, error)
        }
    }

    /**
     hotel full rates availability
     
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func hotelsRatesGet(hotelIds: String, checkin: String, checkout: String, guestNationality: String, currency: String, adults: Int, children: String? = nil, guestId: String? = nil, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return hotelsRatesGetWithRequestBuilder(hotelIds: hotelIds, checkin: checkin, checkout: checkout, guestNationality: guestNationality, currency: currency, adults: adults, children: children, guestId: guestId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     hotel full rates availability
     - GET /hotels/rates
     - The Full Rates  API is to search and return all available rooms along with its rates, cancellation policies for a list of hotel ID's based on the search dates.   For each hotel ID, all available room information is returned.   The API also has a built in loyalty rewards system. The system rewards return users who have made prior bookings.   If the search is coming from a known guest ID, the guest level is also returned along with the pricing that's appropriate for the guest level.  If it is a new user, the guest ID will be generated at the time of the first confirmed booking.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter hotelIds: (query) List of hotelIds 
     - parameter checkin: (query) Check in data in YYYY-MM-DD format 
     - parameter checkout: (query) Check out data in YYYY-MM-DD format 
     - parameter guestNationality: (query) Guest nationality ISO-2 code - example (SG) 
     - parameter currency: (query) Currency code - example (USD) 
     - parameter adults: (query) Number of adult guests staying 
     - parameter children: (query) Number of children staying if any (optional)
     - parameter guestId: (query) Unique traveler ID if available (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func hotelsRatesGetWithRequestBuilder(hotelIds: String, checkin: String, checkout: String, guestNationality: String, currency: String, adults: Int, children: String? = nil, guestId: String? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/hotels/rates"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "hotelIds": (wrappedValue: hotelIds.encodeToJSON(), isExplode: true),
            "checkin": (wrappedValue: checkin.encodeToJSON(), isExplode: true),
            "checkout": (wrappedValue: checkout.encodeToJSON(), isExplode: true),
            "guestNationality": (wrappedValue: guestNationality.encodeToJSON(), isExplode: true),
            "currency": (wrappedValue: currency.encodeToJSON(), isExplode: true),
            "adults": (wrappedValue: adults.encodeToJSON(), isExplode: true),
            "children": (wrappedValue: children?.encodeToJSON(), isExplode: true),
            "guestId": (wrappedValue: guestId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
