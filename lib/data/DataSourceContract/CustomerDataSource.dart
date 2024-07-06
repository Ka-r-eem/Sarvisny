import 'package:sarvisny/domain/model/CustomerRelatedResponses/PaymentTransactionResponse.dart';

import '../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/AddProviderToFavResponse.dart';
import '../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../../domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../domain/model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';
import '../../domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/RemoveFromCartResponse.dart';
import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';

abstract class CustomerDataSource {
  Future<AddToCartResponse> AddToCart(context, String? customerID, String? providerID, List<String>? serviceIDs, String? slotID,String? districtID,String? address, String? des, String? requestDay);
  Future<GetCartResponse?> GetCart(String? Id);
  Future<OrderCartResponse?> OrderCart(String? customerID , String? paymentmethod);
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
  Future<AddProviderToFavResponse> AddProviderToFav(String? workerID, String? customerId);
  Future<AddProviderToFavResponse> RemoveProviderFromFav(String? workerID, String? customerId);

}