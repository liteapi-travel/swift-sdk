//
// StaticDataAPI.swift
//
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class StaticDataAPI {

    /**
     Get cities list
     - parameter countryCode: (query) Country code in iso-2 format (example: SG) 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCitiesByCountry(countryCode: String, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataCitiesGet(countryCode: countryCode) { (response, error) in
            completion(response, error)
        }
    }

    /**
     City list
     - parameter countryCode: (query) Country code in iso-2 format (example: SG) 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataCitiesGet(countryCode: String, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataCitiesGetWithRequestBuilder(countryCode: countryCode).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     City list
     - GET /data/cities
     - The API returns a list of city names from a specific country. The country codes needs be is in ISO-2 format. To get the country codes in ISO-2 for all countries please use the **GET** Country list endpoint
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter countryCode: (query) Country code in iso-2 format (example: SG) 
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataCitiesGetWithRequestBuilder(countryCode: String) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/cities"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "countryCode": (wrappedValue: countryCode.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }


    /**
     Get countries list
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCountries(completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataCountriesGet(){ (response, error) in
            completion(response, error)
        }
    }
    /**
     Country list
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataCountriesGet(apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataCountriesGetWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Country list
     - GET /data/countries
     - The API returns the list of countries available along with its ISO-2 code.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataCountriesGetWithRequestBuilder() -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/countries"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
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
     Get currencies list
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCurrencies(completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataCurrenciesGet(){ (response, error) in
            completion(response, error)
        }
    }
    /**
     Currency list
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataCurrenciesGet(apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataCurrenciesGetWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Currency list
     - GET /data/currencies
     - The API returns all available currency codes along with its name and the list of supported countries that the currency applies to.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataCurrenciesGetWithRequestBuilder() -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/currencies"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
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
    Get hotel details
     - parameter hotelId: (query) Unique ID of a hotel
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getHotelDetails(hotelId: String,completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataHotelGet(hotelId:hotelId){ (response, error) in
            completion(response, error)
        }
    }
    /**
     Hotel details
     
     - parameter hotelId: (query) Unique ID of a hotel 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataHotelGet(hotelId: String, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataHotelGetWithRequestBuilder(hotelId: hotelId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Hotel details
     - GET /data/hotel
     - The hotel details API returns all the static contents details of a hotel or property if the hotel ID is provided. The static content include name, description, address, amenities, cancellation policies, images and more.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter hotelId: (query) Unique ID of a hotel 
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataHotelGetWithRequestBuilder(hotelId: String) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/hotel"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "hotelId": (wrappedValue: hotelId.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }

    /**
     Get hotels list
     - parameter countryCode: (query) country code ISO-2 code - example (SG) 
     - parameter cityName: (query) name of the city 
     - parameter offset: (query) specifies the number of rows to skip before starting to return rows (optional)
     - parameter limit: (query) limit number of results (max 1000) (optional)
     - parameter longitude: (query) longitude geo coordinates (optional)
     - parameter latitude: (query) latitude geo coordinates (optional)
     - parameter distance: (query) distance in meters (min 1000m) (optional)
     - parameter completion: completion handler to receive the data and the error objects

     */
    open class func getHotels(countryCode: String, cityName: String, offset: Int? = nil, limit: Int? = nil, longitude: String? = nil, latitude: String? = nil, distance: Int? = nil, completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataHotelsGet(countryCode: countryCode, cityName: cityName, offset: offset, limit: limit, longitude: longitude, latitude: latitude, distance: distance){ (response, error) in
            completion(response, error)
        }
    }
    /**
     Hotel list
     
     - parameter countryCode: (query) country code ISO-2 code - example (SG) 
     - parameter cityName: (query) name of the city 
     - parameter offset: (query) specifies the number of rows to skip before starting to return rows (optional)
     - parameter limit: (query) limit number of results (max 1000) (optional)
     - parameter longitude: (query) longitude geo coordinates (optional)
     - parameter latitude: (query) latitude geo coordinates (optional)
     - parameter distance: (query) distance in meters (min 1000m) (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataHotelsGet(countryCode: String, cityName: String, offset: Int? = nil, limit: Int? = nil, longitude: String? = nil, latitude: String? = nil, distance: Int? = nil, apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataHotelsGetWithRequestBuilder(countryCode: countryCode, cityName: cityName, offset: offset, limit: limit, longitude: longitude, latitude: latitude, distance: distance).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Hotel list
     - GET /data/hotels
     - The API returns a list of hotels available based on different search criterion. The minimum required information is the county code in ISO-2 format.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - parameter countryCode: (query) country code ISO-2 code - example (SG) 
     - parameter cityName: (query) name of the city 
     - parameter offset: (query) specifies the number of rows to skip before starting to return rows (optional)
     - parameter limit: (query) limit number of results (max 1000) (optional)
     - parameter longitude: (query) longitude geo coordinates (optional)
     - parameter latitude: (query) latitude geo coordinates (optional)
     - parameter distance: (query) distance in meters (min 1000m) (optional)
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataHotelsGetWithRequestBuilder(countryCode: String, cityName: String, offset: Int? = nil, limit: Int? = nil, longitude: String? = nil, latitude: String? = nil, distance: Int? = nil) -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/hotels"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "countryCode": (wrappedValue: countryCode.encodeToJSON(), isExplode: true),
            "cityName": (wrappedValue: cityName.encodeToJSON(), isExplode: true),
            "offset": (wrappedValue: offset?.encodeToJSON(), isExplode: true),
            "limit": (wrappedValue: limit?.encodeToJSON(), isExplode: true),
            "longitude": (wrappedValue: longitude?.encodeToJSON(), isExplode: true),
            "latitude": (wrappedValue: latitude?.encodeToJSON(), isExplode: true),
            "distance": (wrappedValue: distance?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }


    /**
    Get IATA code
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getIataCodes(completion: @escaping ((AnyCodable?, Error?) -> Void)) {
        dataIataCodesGet(){ (response, error) in
            completion(response, error)
        }
    }
    /**
     IATA code list
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func dataIataCodesGet(apiResponseQueue: DispatchQueue = LiteAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnyCodable?, _ error: Error?) -> Void)) -> RequestTask {
        return dataIataCodesGetWithRequestBuilder().execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     IATA code list
     - GET /data/iataCodes
     - The API returns the IATA  (International Air Transport Association) codes  for all available airports along with the name of the airport, geographical coordinates and country code in ISO-2 format.
     - API Key:
       - type: apiKey X-API-Key (HEADER)
       - name: apikeyAuth
     - responseHeaders: [Date(String), Content-Type(String), Content-Length(Int), Connection(String), x-amzn-RequestId(String), Access-Control-Allow-Origin(String), Content-Encoding(String), Access-Control-Allow-Headers(String), x-amz-apigw-id(String), Access-Control-Allow-Methods(String), Access-Control-Expose-Headers(String), x-amzn-Remapped-Date(String), Access-Control-Max-Age(Int), Access-Control-Allow-Credentials(Bool)]
     - returns: RequestBuilder<AnyCodable> 
     */
    open class func dataIataCodesGetWithRequestBuilder() -> RequestBuilder<AnyCodable> {
        let localVariablePath = "/data/iataCodes"
        let localVariableURLString = LiteAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnyCodable>.Type = LiteAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
