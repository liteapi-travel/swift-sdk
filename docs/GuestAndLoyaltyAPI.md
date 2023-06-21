# GuestAndLoyaltyAPI

All URIs are relative to *https://api.liteapi.travel/v2.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**guestsGet**](GuestAndLoyaltyAPI.md#guestsget) | **GET** /guests | guests


# **guestsGet**
```swift
    open class func guestsGet(email: String? = nil, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

guests

The guests API returns the unique guest ID of a user based on the users email ID

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let email = "email_example" // String | Email ID of the guest (optional)

// guests
GuestAndLoyaltyAPI.guestsGet(email: email) { (response, error) in
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
 **email** | **String** | Email ID of the guest | [optional] 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

