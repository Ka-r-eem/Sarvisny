

import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/DataSourceContract/CustomerDataSource.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/RemoveFromCartResponse.dart';

import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';


@Injectable(as: CustomerRepository)

class CustomerRepositoryImpl extends CustomerRepository {

  CustomerDataSource dataSource ;
  @factoryMethod CustomerRepositoryImpl(this.dataSource);

  @override
  Future<AddToCartResponse> AddToCart(context, String? customerID, String? providerID, List<String>? serviceIDs, String? slotID,String? districtID,String? address ,String? des,String? requestDay) {
    return dataSource.AddToCart(context, customerID, providerID, serviceIDs, slotID, districtID,address,des,requestDay);
  }

  @override
  Future<GetCartResponse?> GetCart(String? Id) {
    print("inside the repo");
    return dataSource.GetCart(Id);
  }

  @override
  Future<List<CustomerOrderPayload?>?> GetCustomerOrders(String? customerID) {
    return dataSource.GetCustomerOrders(customerID);
  }

  @override
  Future<CustomerProfileData> GetCustomerProfile(String? customerID) {
    return dataSource.GetCustomerProfile(customerID);
  }

  @override
  Future<OrderCartResponse> OrderCart(String? customerID) {
    return dataSource.OrderCart(customerID);
  }

  @override
  Future<RemoveFromCartResponse> RemoveFromCart(String? customerID, String? RequestID) {
    return dataSource.RemoveFromCart(customerID, RequestID);
  }

  @override
  Future<FilteredServicesResponse?> GetFilteredServices(String? CriteriaId) {
    print("inside the data source");
    return dataSource.GetFilteredServices(CriteriaId);
  }

  @override
  Future<GetServiceWorkersResponse> GetServiceWorkers(String? serviceID) {
    return dataSource.GetServiceWorkers(serviceID);
  }

  @override
  Future<ServicesListResponse?> GetServicesList() {
    return dataSource.GetServicesList();
  }

  @override
  Future customerRegistration(CustomerRegisterDataDto data) {
    return dataSource.customerRegistration(data);
  }




}