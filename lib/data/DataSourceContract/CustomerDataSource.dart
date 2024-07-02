import '../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../../domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/RemoveFromCartResponse.dart';
import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';

abstract class CustomerDataSource {
  Future<AddToCartResponse> AddToCart(context, String? customerID, String? providerID, List<String>? serviceIDs, String? slotID,String? districtID,String? address, String? des, String? requestDay);
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