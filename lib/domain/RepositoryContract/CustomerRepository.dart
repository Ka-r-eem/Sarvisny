import '../../data/Responses/CustomerRelatedDto/CustomerRegisterData.dart';
import '../model/AdminRelatedResponses/ServicesListResponse.dart';
import '../model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import '../model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import '../model/CustomerRelatedResponses/GetCartResponse.dart';
import '../model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../model/CustomerRelatedResponses/OrderCartResponse.dart';
import '../model/CustomerRelatedResponses/RemoveFromCartResponse.dart';

abstract class CustomerRepository {
  Future<AddToCartResponse> AddToCart(context, String? customerID,
      String? providerID, String? serviceID, String? slotID, String? des);
  Future<GetCartResponse?> GetCart(String? Id);
  Future<OrderCartResponse> OrderCart(String? customerID);
  Future<List<CustomerOrderPayload?>?> GetCustomerOrders(String? customerID);
  Future<RemoveFromCartResponse> RemoveFromCart(String? customerID, String? RequestID);
  Future<CustomerProfileData> GetCustomerProfile(String? customerID);
  Future<GetServiceWorkersResponse> GetServiceWorkers(String? serviceID);
  Future<dynamic> customerRegistration(CustomerRegisterDataDto data);
  Future<FilteredServicesResponse?> GetFilteredServices (String? CriteriaId);
  Future<ServicesListResponse?> GetServicesList();


}
