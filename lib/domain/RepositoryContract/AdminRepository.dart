import 'package:sarvisny/domain/model/AdminRelatedResponses/AddServiceData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/Block_UnBlock_ServiceProvidersResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomersListResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';
import '../model/AdminRelatedResponses/AddDistrictData.dart';
import '../model/AdminRelatedResponses/AddProviderToDistrict.dart';
import '../model/AdminRelatedResponses/Enable_Disable_DistrictsForProvider.dart';
import '../model/AdminRelatedResponses/GetDistrictsData.dart';
import '../model/AdminRelatedResponses/GetProviderDistricts.dart';
import '../model/WorkerRelatedResponse/WorkersListResponse.dart';



abstract class AdminRepository{

  Future<List<WorkerListObject>?> getWorkers();
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
  Future <List<OrderResponse>?> GetAllOrders();
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














}