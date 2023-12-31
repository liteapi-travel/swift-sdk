//
// BookAPI.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class BookAPI {

    /**
    book
     - parameter ratesBookPostRequest: (body)  (optional)
     */
    open class func book(prebookId: String, guestFirstName: String, guestLastName: String, guestEmail: String, holderName: String, paymentMethod:String, cardNumber: String? = nil, expireMonth: String? = nil, expireYear: String? = nil, cvc: String? = nil, token: String? = nil, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
       
        let guestInfo = RatesBookPostRequestGuestInfo(
            guestFirstName: guestFirstName,
            guestLastName: guestLastName,
            guestEmail: guestEmail
        )

        var payment: RatesBookPostRequestPayment

        if paymentMethod == "CREDIT_CARD" {
            if let expireMonth = expireMonth, let expireYear = expireYear {
                payment = RatesBookPostRequestPayment(
                    holderName: holderName,
                    number: cardNumber,
                    expireDate: expireMonth + "/" + expireYear,
                    cvc: cvc,
                    method: RatesBookPostRequestPayment.Method.creditCard
                )
            } else {
                fatalError("Credit card payment requires valid expiration month and year")
            }
        }else {
            payment = RatesBookPostRequestPayment(
                holderName: holderName,
                method:RatesBookPostRequestPayment.Method.stripeToken,
                token: token
            )
        }
        let ratesBookPostRequest = RatesBookPostRequest(
                prebookId: prebookId,
                guestInfo: guestInfo,
                payment:payment
            )
        ratesBookPost(ratesBookPostRequest:ratesBookPostRequest) { (response, error) in
            completion(response, error)
        }
    }

    /**
     hotel rate book
     
     - parameter ratesBookPostRequest: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func ratesBookPost(ratesBookPostRequest: RatesBookPostRequest? = nil, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return ratesBookPostWithRequestBuilder(ratesBookPostRequest: ratesBookPostRequest).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     hotel rate book
     - POST /rates/book
     - This API confirms a booking when the prebook Id and the rate Id from the pre book stage along with the guest and payment information are passed.  The guest information is an object that should include the guest first name, last name and email.  The payment information is an object that should include the name, credit card number, expiry and CVC number.  The response will confirm the booking along with a booking Id and a hotel confirmation code. It will also include the booking details including the dates, price and the cancellation policies.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amzn-Remapped-Content-Length(Int), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter ratesBookPostRequest: (body)  (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func ratesBookPostWithRequestBuilder(ratesBookPostRequest: RatesBookPostRequest? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/rates/book"
        let localVariableURLString = LiteAPIClientAPI.bookPath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: ratesBookPostRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }


    /**
     prebook
     - parameter ratesBookPostRequest: (body)  (optional)
    */
    open class func prebook(rateId: String, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
       
        let bodyValues = ["rateId": rateId]

        // Wrapping the dictionary using AnyCodable
        let body = AnyCodable(bodyValues)
        ratesPrebookPost(body:body) { (response, error) in
            completion(response, error)
        }
    }

    /**
     hotel rate prebook
     
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func ratesPrebookPost(body: AnyCodable, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return ratesPrebookPostWithRequestBuilder(body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     hotel rate prebook
     - POST /rates/prebook
     - This API is used to confirm if the room and rates for the search criterion. The input to the endpoint is a specific rate Id coming from the **GET** hotel full rates availability API. In response, the API generates a prebook Id, a new rate Id and contains information if  price, cancellation policy or boarding information has changed. Example API key for test sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func ratesPrebookPostWithRequestBuilder(body: AnyCodable? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/rates/prebook"
        let localVariableURLString = LiteAPIClientAPI.bookPath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
