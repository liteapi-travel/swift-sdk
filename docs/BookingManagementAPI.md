# BookingManagementAPI

All URIs are relative to *https://api.liteapi.travel/v2.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bookingsBookingIdGet**](BookingManagementAPI.md#bookingsbookingidget) | **GET** /bookings/{bookingId} | Booking retrieve
[**bookingsBookingIdPut**](BookingManagementAPI.md#bookingsbookingidput) | **PUT** /bookings/{bookingId} | Booking cancel
[**bookingsGet**](BookingManagementAPI.md#bookingsget) | **GET** /bookings | Booking list


# **bookingsBookingIdGet**
```swift
    open class func bookingsBookingIdGet(bookingId: String, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Booking retrieve

The API returns the status and the details for the a specific booking Id.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let bookingId = "bookingId_example" // String | The Booking Id that needs to be retrieved

// Booking retrieve
BookingManagementAPI.bookingsBookingIdGet(bookingId: bookingId) { (response, error) in
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
 **bookingId** | **String** | The Booking Id that needs to be retrieved | 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookingsBookingIdPut**
```swift
    open class func bookingsBookingIdPut(bookingId: String, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Booking cancel

<!-- theme: danger --> This API is used to request a cancellation of an existing confirmed booking. Cancellation policies and conditions will be used to determine the success of the cancellation. For example a booking with non-refundable (NRFN) tag or a booking with a cancellation policy that was requested past the cancellation date will not be able to cancel the confirmed booking.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let bookingId = "bookingId_example" // String | (Required) The unique identifier of the booking you would like to update.

// Booking cancel
BookingManagementAPI.bookingsBookingIdPut(bookingId: bookingId) { (response, error) in
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
 **bookingId** | **String** | (Required) The unique identifier of the booking you would like to update. | 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookingsGet**
```swift
    open class func bookingsGet(guestId: String, completion: @escaping (_ data: AnyCodable?, _ error: Error?) -> Void)
```

Booking list

The API returns the list of booking Id's for a given guest Id.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let guestId = "guestId_example" // String | The Guest Id of the user

// Booking list
BookingManagementAPI.bookingsGet(guestId: guestId) { (response, error) in
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
 **guestId** | **String** | The Guest Id of the user | 

### Return type

**AnyCodable**

### Authorization

[apikeyAuth](../README.md#apikeyAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

