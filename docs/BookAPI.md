# BookAPI

All URIs are relative to *https://api.liteapi.travel/v2.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ratesBookPost**](BookAPI.md#ratesbookpost) | **POST** /rates/book | hotel rate book
[**ratesPrebookPost**](BookAPI.md#ratesprebookpost) | **POST** /rates/prebook | hotel rate prebook


# **ratesBookPost**
```swift
    open class func ratesBookPost(ratesBookPostRequest: RatesBookPostRequest? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

hotel rate book

This API confirms a booking when the prebook Id and the rate Id from the pre book stage along with the guest and payment information are passed.  The guest information is an object that should include the guest first name, last name and email.  The payment information is an object that should include the name, credit card number, expiry and CVC number.  The response will confirm the booking along with a booking Id and a hotel confirmation code. It will also include the booking details including the dates, price and the cancellation policies.   Example API key for test: sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let ratesBookPostRequest = _rates_book_post_request(prebookId: "prebookId_example", guestInfo: _rates_book_post_request_guestInfo(guestFirstName: "guestFirstName_example", guestLastName: "guestLastName_example", guestEmail: "guestEmail_example"), payment: _rates_book_post_request_payment(holderName: "holderName_example", number: "number_example", expireDate: "expireDate_example", cvc: "cvc_example", method: "method_example", token: "token_example")) // RatesBookPostRequest |  (optional)

// hotel rate book
BookAPI.ratesBookPost(ratesBookPostRequest: ratesBookPostRequest) { (response, error) in
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
 **ratesBookPostRequest** | [**RatesBookPostRequest**](RatesBookPostRequest.md) |  | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ratesPrebookPost**
```swift
    open class func ratesPrebookPost(body: AnyCodable? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

hotel rate prebook

This API is used to confirm if the room and rates for the search criterion. The input to the endpoint is a specific rate Id coming from the **GET** hotel full rates availability API. In response, the API generates a prebook Id, a new rate Id and contains information if  price, cancellation policy or boarding information has changed. Example API key for test sand_c0155ab8-c683-4f26-8f94-b5e92c5797b9

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let body = "TODO" // AnyCodable |  (optional)

// hotel rate prebook
BookAPI.ratesPrebookPost(body: body) { (response, error) in
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
 **body** | **AnyCodable** |  | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

