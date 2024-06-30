
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

import '../../domain/model/AdminRelatedResponses/AddDistrictData.dart';
import '../../domain/model/AdminRelatedResponses/AddProviderToDistrict.dart';
import '../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../domain/model/AdminRelatedResponses/Block_UnBlock_ServiceProvidersResponse.dart';
import '../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../domain/model/AdminRelatedResponses/Enable_Disable_DistrictsForProvider.dart';
import '../../domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import '../../domain/model/AdminRelatedResponses/GetProviderDistricts.dart';
import '../../domain/model/AdminRelatedResponses/OrdersResponse.dart';
import '../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomersListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';


abstract class AdminDataSource{

  Future <List<WorkerListObject>?> getWorkers();
  Future<dynamic> addCriteria(criteriaData);
  Future<List<ServiceObject>?> AdminGetServices();
  Future<List<CustomerListObject>?> AdminGetCustomers();
  Future<dynamic> AdminReject(WorkerID);
  Future<dynamic> AdminApprove(WorkerID);
  Future<List<WorkerRequest>?> AdminGetRequests();
  Future<List<CriteriaObject>?> GetAllCriterai();
  Future<List<WorkerData>?> GetAllWorkersForService(serviceID);
  Future<dynamic> AddServiceToCriteria(CriteriaID, ServiceID);
  Future<dynamic> AddService(AddServiceData data);
  Future<BlockUnBlockServiceProvidersResponse?> BlockProvider(providerID);
  Future<BlockUnBlockServiceProvidersResponse?>UnBlockProvider(providerID);
  Future <List<OrderResponse>?>GetAllOrders();
  Future <List<OrderResponse>?>GetApprovedOrders();
  Future <List<OrderResponse>?>GetRequestedOrders();
  Future <List<OrderResponse>?>GetCancelledOrders();
  Future <List<OrderResponse>?>GetRejectedOrders();
  Future <List<OrderResponse>?>GetExpiredOrders();
  Future<AddDistrictData> AddDistrict(String? name);
  Future<GetDistrictsData> GetAllDistricts();
  Future<GetProviderDistricts> getProviderDistricts(String? providerID);
  Future<AddProviderToDistrict> AddWorkerToDistrict(String? providerID , String? districtID);
  Future<EnableDisableDistrictsForProvider> EnableDistrict(String? providerID , String? districtID);
  Future<EnableDisableDistrictsForProvider> DisableDistrict(String? providerID , String? districtID);
  Future<ParentsServicesResponse> GetParents() ;
  Future<ChildrenServicesResponse> GetChildren(String? serviceID) ;

}