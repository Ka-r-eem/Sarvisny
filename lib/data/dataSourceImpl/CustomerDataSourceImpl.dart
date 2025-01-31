import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/DataSourceContract/CustomerDataSource.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CancelOrderResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerRegisterData.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/PaymentTransactionResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/RemoveFromCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/AddProviderToFavResponse.dart';
import '../../domain/model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';
import '../API/apiManager.dart';
import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';

@Injectable(as: CustomerDataSource)
class CustomerDataSourceimpl extends CustomerDataSource {
  ApiManager apiManager;

  @factoryMethod
  CustomerDataSourceimpl(this.apiManager);

  @override
  Future<AddToCartResponse> AddToCart(
      context,
      String? customerID,
      String? providerID,
      List<String>? serviceIDs,
      String? slotID,
      String? districtID,
      String? address,
      String? des,
      String? requestDay) async {
    var response = await apiManager.AddToCart(
        context, customerID, providerID, serviceIDs, slotID,districtID, address, des,requestDay);
    return response.toAddCartResponse();
  }

  @override
  Future<GetCartResponse?> GetCart(String? Id) async {
    var response = await apiManager.GetCart(Id);
    print(response?.status);
    print("response inside datasource: ${response?.payload?.cartID}");
    return response;
  }
  @override
  Future<List<CustomerOrdersPayload?>?> GetCustomerOrders(
      String? customerID) async {
    print("inside the data source impl");
    print(customerID);
    var response = await apiManager.GetCustomerOrders(customerID);
    print('inside ds impl : ${response?.payload?.first.orderId}');
    return response?.payload
        ?.map((dto) => dto.toCustomerOrdersPayload())
        .toList();
  }

  @override
  Future<CustomerProfileData> GetCustomerProfile(String? customerID) async {
    print("inside the data source impl");
    var response = await apiManager.GetCustomerProfile(customerID);
    print(response.payload?.toCustomerProfileDetails().firstName);
    return response.toCustomerProfileData();
  }

  @override
  Future<OrderCartResponse?> OrderCart(String? customerID , String? paymentmethod) async {
    var response = await apiManager.OrderCart(customerID , paymentmethod);
    print("response inside datasource: ${response?.payload}");
    return response;
  }

  @override
  Future<RemoveFromCartResponse> RemoveFromCart(
      String? customerID, String? RequestID) async {
    var response = await apiManager.RemoveFromCart(customerID, RequestID);
    return response.toRemoveFromCartResponse();
  }

  @override
  Future<GetServiceWorkersResponse> GetServiceWorkers(String? serviceID) async {
    var response = await apiManager.GetServiceWorkers(serviceID);
    return response.toServiceWorkersResponse();
  }

  @override
  Future<FilteredServicesResponse?> GetFilteredServices(
      String? CriteriaId) async {
    print("inside api manager");
    var response = await apiManager.GetCriteriaServices(CriteriaId);
    print(response?.payload?.criteriaName);
    return response?.toFilteredServicesResponse();
  }

  @override
  Future<ServicesListResponse?> GetServicesList() async {
    var response = await apiManager.GetServicesList();
    return response?.toServicesListResponse();
  }

  @override
  Future customerRegistration(CustomerRegisterDataDto data) async {
    var response = await apiManager.registerCustomer(data);
    return response;
  }

  @override
  Future<PaymentTransactionResponse?> PayTransaction(String? transID) async{
    var response = await apiManager.PayTrasaction(transID);
    return response;
  }

  @override
  Future<GetAllMatchedResponse> GetAllMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) {
    var response = apiManager.GetAllMatched(serviceId, day, time, districtId, customerId);
    return response;
  }

  @override
  Future<GetFirstSecMatchedResponse> GetFirstMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) {
    var response = apiManager.GetFirstMatched(serviceId, day, time, districtId, customerId);
    return response;
  }

  @override
  Future<GetFirstSecMatchedResponse> GetSecMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) {
    var response = apiManager.GetSecMatched(serviceId, day, time, districtId, customerId);
    return response;
  }

  @override
  Future<GetCustomerFavResponse> GetCustomerFav(String? customerID) {
    var response = apiManager.GetCustomerFav(customerID);
    return response;
  }

  @override
  Future<AddProviderToFavResponse> AddProviderToFav(String? workerID, String? customerId) {
    var response = apiManager.AddProviderToFav(workerID, customerId);
    return response;
  }

  @override
  Future<AddProviderToFavResponse> RemoveProviderFromFav(String? workerID, String? customerId) {
    var response = apiManager.RemoveProviderFromFav(workerID, customerId);
    return response;
  }

  @override
  Future<CancelOrderResponse> CustomerCancelOrder(String? orderID, String? customerId) {
    var response = apiManager.CustomerCancelOrder(orderID, customerId);
    return response;
  }
}
