//
// GuestAndLoyaltyAPI.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class GuestAndLoyaltyAPI {

    /**
     guests
     
     - parameter email: (query) Email ID of the guest (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     */
   open class func getGuests(email: String? = nil, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        guestsGet(email: email) { (response, error) in
            completion(response, error)
        }
    }

    /**
     guests
     
     - parameter email: (query) Email ID of the guest (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func guestsGet(email: String? = nil, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return guestsGetWithRequestBuilder(email: email).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     guests
     - GET /guests
     - The guests API returns the unique guest ID of a user based on the users email ID
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter email: (query) Email ID of the guest (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func guestsGetWithRequestBuilder(email: String? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/guests"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "email": (wrappedValue: email?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
