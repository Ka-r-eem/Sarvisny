import '../../data/Responses/CustomerRelatedDto/CustomerRegisterData.dart';
import '../model/AdminRelatedResponses/ServicesListResponse.dart';
import '../model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import '../model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import '../model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import '../model/CustomerRelatedResponses/GetCartResponse.dart';
import '../model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import '../model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';
import '../model/CustomerRelatedResponses/OrderCartResponse.dart';
import '../model/CustomerRelatedResponses/PaymentTransactionResponse.dart';
import '../model/CustomerRelatedResponses/RemoveFromCartResponse.dart';

abstract class CustomerRepository {
  Future<AddToCartResponse> AddToCart(context, String? customerID,
      String? providerID, List<String>? serviceIDs, String? slotID,String? districtID,String? address, String? des,String? requestDay);
  Future<GetCartResponse?> GetCart(String? Id);
  Future<OrderCartResponse?> OrderCart(String? customerID, String? paymentmethod);
  Future<List<CustomerOrdersPayload?>?> GetCustomerOrders(String? customerID);
  Future<RemoveFromCartResponse> RemoveFromCart(String? customerID, String? RequestID);
  Future<CustomerProfileData> GetCustomerProfile(String? customerID);
  Future<GetServiceWorkersResponse> GetServiceWorkers(String? serviceID);
  Future<dynamic> customerRegistration(CustomerRegisterDataDto data);
  Future<FilteredServicesResponse?> GetFilteredServices (String? CriteriaId);
  Future<ServicesListResponse?> GetServicesList();
  Future<PaymentTransactionResponse?> PayTransaction(String? transID);
  Future<GetFirstSecMatchedResponse> GetFirstMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId);
  Future<GetFirstSecMatchedResponse> GetSecMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId);
  Future<GetAllMatchedResponse> GetAllMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId);
  Future<GetCustomerFavResponse> GetCustomerFav(String? customerID);


}
