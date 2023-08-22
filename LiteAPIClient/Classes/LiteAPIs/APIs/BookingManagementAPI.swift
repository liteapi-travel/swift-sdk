//
// BookingManagementAPI.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class BookingManagementAPI {

    /**
      Retrieved booking 
     - parameter bookingId: (path) The Booking Id that needs to be retrieved 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func retrievedBooking(bookingId: String, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        bookingsBookingIdGet(bookingId: bookingId) { (response, error) in
            completion(response, error)
        }
    }
    /**
     Booking retrieve
     
     - parameter bookingId: (path) The Booking Id that needs to be retrieved 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func bookingsBookingIdGet(bookingId: String, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return bookingsBookingIdGetWithRequestBuilder(bookingId: bookingId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Booking retrieve
     - GET /bookings/{bookingId}
     - The API returns the status and the details for the a specific booking Id.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter bookingId: (path) The Booking Id that needs to be retrieved 
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func bookingsBookingIdGetWithRequestBuilder(bookingId: String) -> RequestBuilder<AnyCodable> {
        var localVariablePath = "/bookings/{bookingId}"
        let bookingIdPreEscape = "\(APIHelper.mapValueToPathItem(bookingId))"
        let bookingIdPostEscape = bookingIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{bookingId}", with: bookingIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = LiteAPIClientAPI.bookPath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }


    /**
      Cancel booking
     - parameter bookingId: (path) The Booking Id that needs to be retrieved 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func cancelBooking(bookingId: String, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        bookingsBookingIdPut(bookingId: bookingId) { (response, error) in
            completion(response, error)
        }
    }
    /**
     Booking cancel
     
     - parameter bookingId: (path) (Required) The unique identifier of the booking you would like to update. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func bookingsBookingIdPut(bookingId: String, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return bookingsBookingIdPutWithRequestBuilder(bookingId: bookingId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Booking cancel
     - PUT /bookings/{bookingId}
     - <!-- theme: danger --> This API is used to request a cancellation of an existing confirmed booking. Cancellation policies and conditions will be used to determine the success of the cancellation. For example a booking with non-refundable (NRFN) tag or a booking with a cancellation policy that was requested past the cancellation date will not be able to cancel the confirmed booking.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter bookingId: (path) (Required) The unique identifier of the booking you would like to update. 
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func bookingsBookingIdPutWithRequestBuilder(bookingId: String) -> RequestBuilder<AnyCodable> {
        var localVariablePath = "/bookings/{bookingId}"
        let bookingIdPreEscape = "\(APIHelper.mapValueToPathItem(bookingId))"
        let bookingIdPostEscape = bookingIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{bookingId}", with: bookingIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = LiteAPIClientAPI.bookPath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
      Get booking list
     - parameter bookingId: (path) The Booking Id that needs to be retrieved 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getBookingListByGuestId(guestId: String, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        bookingsGet(guestId: guestId) { (response, error) in
            completion(response, error)
        }
    }
    /**
     Booking list
     
     - parameter guestId: (query) The Guest Id of the user 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func bookingsGet(guestId: String, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return bookingsGetWithRequestBuilder(guestId: guestId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Booking list
     - GET /bookings
     - The API returns the list of booking Id's for a given guest Id.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter guestId: (query) The Guest Id of the user 
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func bookingsGetWithRequestBuilder(guestId: String) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/bookings"
        let localVariableURLString = LiteAPIClientAPI.bookPath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "guestId": (wrappedValue: guestId.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
