# StaticDataAPI

All URIs are relative to *https://api.liteapi.travel/v2.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**dataCitiesGet**](StaticDataAPI.md#datacitiesget) | **GET** /data/cities | City list
[**dataCountriesGet**](StaticDataAPI.md#datacountriesget) | **GET** /data/countries | Country list
[**dataCurrenciesGet**](StaticDataAPI.md#datacurrenciesget) | **GET** /data/currencies | Currency list
[**dataHotelGet**](StaticDataAPI.md#datahotelget) | **GET** /data/hotel | Hotel details
[**dataHotelsGet**](StaticDataAPI.md#datahotelsget) | **GET** /data/hotels | Hotel list
[**dataIataCodesGet**](StaticDataAPI.md#dataiatacodesget) | **GET** /data/iataCodes | IATA code list


# **dataCitiesGet**
```swift
    open class func dataCitiesGet(countryCode: String, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

City list

The API returns a list of city names from a specific country. The country codes needs be is in ISO-2 format. To get the country codes in ISO-2 for all countries please use the **GET** Country list endpoint

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let countryCode = "countryCode_example" // String | Country code in iso-2 format (example: SG)

// City list
StaticDataAPI.dataCitiesGet(countryCode: countryCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryCode** | **String** | Country code in iso-2 format (example: SG) | 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dataCountriesGet**
```swift
    open class func dataCountriesGet(completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Country list

The API returns the list of countries available along with its ISO-2 code.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Country list
StaticDataAPI.dataCountriesGet() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dataCurrenciesGet**
```swift
    open class func dataCurrenciesGet(completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Currency list

The API returns all available currency codes along with its name and the list of supported countries that the currency applies to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Currency list
StaticDataAPI.dataCurrenciesGet() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dataHotelGet**
```swift
    open class func dataHotelGet(hotelId: Int, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Hotel details

The hotel details API returns all the static contents details of a hotel or property if the hotel ID is provided. The static content include name, description, address, amenities, cancellation policies, images and more.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let hotelId = 987 // Int | Unique ID of a hotel

// Hotel details
StaticDataAPI.dataHotelGet(hotelId: hotelId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hotelId** | **Int** | Unique ID of a hotel | 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dataHotelsGet**
```swift
    open class func dataHotelsGet(countryCode: String, cityName: String, offset: Int? = nil, limit: Int? = nil, longitude: Double? = nil, latitude: Double? = nil, distance: Int? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Hotel list

The API returns a list of hotels available based on different search criterion. The minimum required information is the county code in ISO-2 format.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let countryCode = "countryCode_example" // String | country code ISO-2 code - example (SG)
let cityName = "cityName_example" // String | name of the city
let offset = 987 // Int | specifies the number of rows to skip before starting to return rows (optional)
let limit = 987 // Int | limit number of results (max 1000) (optional)
let longitude = 987 // Double | longitude geo coordinates (optional)
let latitude = 987 // Double | latitude geo coordinates (optional)
let distance = 987 // Int | distance in meters (min 1000m) (optional)

// Hotel list
StaticDataAPI.dataHotelsGet(countryCode: countryCode, cityName: cityName, offset: offset, limit: limit, longitude: longitude, latitude: latitude, distance: distance) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryCode** | **String** | country code ISO-2 code - example (SG) | 
 **cityName** | **String** | name of the city | 
 **offset** | **Int** | specifies the number of rows to skip before starting to return rows | [optional] 
 **limit** | **Int** | limit number of results (max 1000) | [optional] 
 **longitude** | **Double** | longitude geo coordinates | [optional] 
 **latitude** | **Double** | latitude geo coordinates | [optional] 
 **distance** | **Int** | distance in meters (min 1000m) | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dataIataCodesGet**
```swift
    open class func dataIataCodesGet(completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

IATA code list

The API returns the IATA  (International Air Transport Association) codes  for all available airports along with the name of the airport, geographical coordinates and country code in ISO-2 format.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// IATA code list
StaticDataAPI.dataIataCodesGet() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

