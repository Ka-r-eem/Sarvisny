class CustomerApiPaths {
  static const String customerRegistrationPath = "/api/Customer/register";
  static const String GetServicesByCriteria = "/api/Criteria/";
  static const String GetServiceWorkersPath = "/api/services/GetAllWorkersForService";
  static const String AddToCartPath = "/api/Customer/addtocart";
  static const String RemoveFromCartPath = "/api/Customer/removeFromCart";
  static const String GetCartPath = "/api/Customer/getCart";
  static const String GetServicePath = "/api/services/GetAllServices";
  static const String OrderCartPath = "/api/Customer/orderCart";
  static const String GetCustomerOrdersPath = "/api/Customer/getCustomerOrdersLog/";
  static const String GetCustomerProfilePath = "/api/Customer/getCustomerProfile/";
  static const String RefundOrderPath = "/api/Customer/refundOrder/{orderId}";
  static const String AddProviderToFavPath = "/api/Customer/AddProviderToFav";
  static const String RemoveProviderFromFavPath = "/api/Customer/RemoveFavProvider";
  static const String GetCustomerFavouritesPath = "/api/Customer/getCustomerFavourites/{customerId}";
  static const String GetAllMatchedProvidersPath = "/api/Customer/getAllMatchedProviderSortedbyFav";
  static const String GetOrderStatusPath = "/api/Customer/getOrderStatus";
  static const String UpdateCustomerProfilePath = "/api/Customer/updateCustomerProfile/{customerId}";
  static const String AddCustomerRatingPath = "/api/Customer/addCustomerRating/{orderId}";
  static const String GetCustomerRatingPath = "/api/Customer/GetCustomerRating/{orderId}";
  static const String GetFirstSuggestedProviderPath = "/api/Customer/getFirstSuggestionsSortedbyFav";
  static const String GetSecondSuggestedProviderPath = "/api/Customer/getSecondSuggestionsSortedbyFav";
  static const String GetCanceledPath = "/api/Customer/customerOrders/{customerId}/status/canceled";
}



