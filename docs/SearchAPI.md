# SearchAPI

All URIs are relative to *https://api.liteapi.travel/v2.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**hotelsGet**](SearchAPI.md#hotelsget) | **GET** /hotels | hotel minimum rates availability
[**hotelsRatesGet**](SearchAPI.md#hotelsratesget) | **GET** /hotels/rates | hotel full rates availability


# **hotelsGet**
```swift
    open class func hotelsGet(hotelIds: String, checkin: String, checkout: String, currency: String, guestNationality: String, adults: Int, children: String? = nil, guestId: String? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

hotel minimum rates availability

**Hotel Minimum Rates API** is to search and return the minimum room rates that are available for a list of hotel ID's on the specified search dates.  For each hotel ID, the minimum room rate that is available is returned.  The API also has a built in loyalty rewards system. The system rewards return users who have made prior bookings.  If the search is coming from a known guest ID, the guest level is also returned along with pricing has more discounts.  If it is a new user, the guest ID will be generated at the time of the first confirmed booking.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let hotelIds = "hotelIds_example" // String | List of hotelIds
let checkin = "checkin_example" // String | Check in data in YYYY-MM-DD format
let checkout = "checkout_example" // String | Check out data in YYYY-MM-DD format
let currency = "currency_example" // String | Currency code - example (USD)
let guestNationality = "guestNationality_example" // String | Guest nationality ISO-2 code - example (SG)
let adults = 987 // Int | Number of adult guests staying
let children = "children_example" // String | Number of children staying if any (optional)
let guestId = "guestId_example" // String | Unique traveler ID if available (optional)

// hotel minimum rates availability
SearchAPI.hotelsGet(hotelIds: hotelIds, checkin: checkin, checkout: checkout, currency: currency, guestNationality: guestNationality, adults: adults, children: children, guestId: guestId) { (response, error) in
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
 **hotelIds** | **String** | List of hotelIds | 
 **checkin** | **String** | Check in data in YYYY-MM-DD format | 
 **checkout** | **String** | Check out data in YYYY-MM-DD format | 
 **currency** | **String** | Currency code - example (USD) | 
 **guestNationality** | **String** | Guest nationality ISO-2 code - example (SG) | 
 **adults** | **Int** | Number of adult guests staying | 
 **children** | **String** | Number of children staying if any | [optional] 
 **guestId** | **String** | Unique traveler ID if available | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **hotelsRatesGet**
```swift
    open class func hotelsRatesGet(hotelIds: String, checkin: String, checkout: String, guestNationality: String, currency: String, adults: Int, children: String? = nil, guestId: String? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

hotel full rates availability

The Full Rates  API is to search and return all available rooms along with its rates, cancellation policies for a list of hotel ID's based on the search dates.   For each hotel ID, all available room information is returned.   The API also has a built in loyalty rewards system. The system rewards return users who have made prior bookings.   If the search is coming from a known guest ID, the guest level is also returned along with the pricing that's appropriate for the guest level.  If it is a new user, the guest ID will be generated at the time of the first confirmed booking.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let hotelIds = "hotelIds_example" // String | List of hotelIds
let checkin = "checkin_example" // String | Check in data in YYYY-MM-DD format
let checkout = "checkout_example" // String | Check out data in YYYY-MM-DD format
let guestNationality = "guestNationality_example" // String | Guest nationality ISO-2 code - example (SG)
let currency = "currency_example" // String | Currency code - example (USD)
let adults = 987 // Int | Number of adult guests staying
let children = "children_example" // String | Number of children staying if any (optional)
let guestId = "guestId_example" // String | Unique traveler ID if available (optional)

// hotel full rates availability
SearchAPI.hotelsRatesGet(hotelIds: hotelIds, checkin: checkin, checkout: checkout, guestNationality: guestNationality, currency: currency, adults: adults, children: children, guestId: guestId) { (response, error) in
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
 **hotelIds** | **String** | List of hotelIds | 
 **checkin** | **String** | Check in data in YYYY-MM-DD format | 
 **checkout** | **String** | Check out data in YYYY-MM-DD format | 
 **guestNationality** | **String** | Guest nationality ISO-2 code - example (SG) | 
 **currency** | **String** | Currency code - example (USD) | 
 **adults** | **Int** | Number of adult guests staying | 
 **children** | **String** | Number of children staying if any | [optional] 
 **guestId** | **String** | Unique traveler ID if available | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

