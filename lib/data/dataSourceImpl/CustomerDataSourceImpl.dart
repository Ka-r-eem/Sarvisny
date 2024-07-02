import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/DataSourceContract/CustomerDataSource.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerRegisterData.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/RemoveFromCartResponse.dart';
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
    return response?.toGetCartResponse();
  }

  @override
  Future<List<CustomerOrderPayload?>?> GetCustomerOrders(
      String? customerID) async {
    print("inside the data source impl");
    print(customerID);
    var response = await apiManager.GetCustomerOrders(customerID);
    return response.payload
        ?.map((dto) => dto.toCustomerOrderDetails().payload)
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
  Future<OrderCartResponse> OrderCart(String? customerID) async {
    var response = await apiManager.OrderCart(customerID);
    return response.toOrderCartResponse();
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
}
