

import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/Responses/AdminRelatedDto/AddDistrictData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/AddProviderToDistrict.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/Enable_Disable_DistrictsForProvider.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetProviderDistricts.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

import '../../domain/RepositoryContract/AdminRepository.dart';
import '../../domain/model/AdminRelatedResponses/AddDistrictData.dart';
import '../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../domain/model/AdminRelatedResponses/Block_UnBlock_ServiceProvidersResponse.dart';
import '../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../domain/model/AdminRelatedResponses/OrdersResponse.dart';
import '../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/CustomersListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';
import '../DataSourceContract/AdminDataSource.dart';
import '../Responses/AdminRelatedDto/AddServiceData.dart';

@Injectable(as: AdminRepository)


class AdminRepositoryImpl extends AdminRepository {

  AdminDataSource dataSource ;
  @factoryMethod AdminRepositoryImpl(this.dataSource);

  @override
  Future AddService(AddServiceData serviceData) {
    print("inside repo impl");
    return dataSource.AddService(serviceData);
  }

  @override
  Future AddServiceToCriteria(CriteriaID, ServiceID) {
    return dataSource.AddServiceToCriteria(CriteriaID, ServiceID);
  }

  @override
  Future AdminApprove(WorkerID) {
    return dataSource.AdminApprove(WorkerID);
  }

  @override
  Future<List<CustomerListObject>?> AdminGetCustomers() {
   return dataSource.AdminGetCustomers();
  }

  @override
  Future<List<WorkerRequest>?> AdminGetRequests() {
    return dataSource.AdminGetRequests();
  }

  @override
  Future<List<ServiceObject>?> AdminGetServices() {
    print("inside the repo impl");
    return dataSource.AdminGetServices();
  }

  @override
  Future AdminReject(WorkerID) {
    return dataSource.AdminReject(WorkerID);
  }

  @override
  Future<BlockUnBlockServiceProvidersResponse?> BlockProvider(providerID) {
    return dataSource.BlockProvider(providerID);
  }

  @override
  Future<List<CriteriaObject>?> GetAllCriterai() {
   return dataSource.GetAllCriterai();
  }

  @override
  Future <List<OrderResponse>?> GetAllOrders() {
    return dataSource.GetAllOrders();
  }

  @override
  Future<List<WorkerData>?> GetAllWorkersForService(serviceID) {
    return dataSource.GetAllWorkersForService(serviceID);
  }

  @override
  Future<List<OrderResponse>?> GetApprovedOrders() {
    return dataSource.GetApprovedOrders();
  }

  @override
  Future<List<OrderResponse>?> GetRequestedOrders() {
    return dataSource.GetRequestedOrders();
  }

  @override
  Future<BlockUnBlockServiceProvidersResponse?> UnBlockProvider(providerID) {
    return dataSource.UnBlockProvider(providerID);
  }

  @override
  Future addCriteria(criteriaData) {
    return dataSource.addCriteria(criteriaData);
  }

  @override
  Future<List<WorkerListObject>?> getWorkers() {
    return dataSource.getWorkers();
  }

  @override
  Future<List<OrderResponse>?> GetCancelledOrders() {
    return dataSource.GetCancelledOrders();
  }

  @override
  Future<List<OrderResponse>?> GetExpiredOrders() {
    return dataSource.GetExpiredOrders();
  }

  @override
  Future<List<OrderResponse>?> GetRejectedOrders() {
    return dataSource.GetRejectedOrders();
  }

  @override
  Future<AddProviderToDistrict> AddWorkerToDistrict(String? providerID, String? districtID) {
    return dataSource.AddWorkerToDistrict(providerID, districtID);
  }

  @override
  Future<EnableDisableDistrictsForProvider> DisableDistrict(String? providerID, String? districtID) {
  return dataSource.DisableDistrict(providerID, districtID);
  }

  @override
  Future<EnableDisableDistrictsForProvider> EnableDistrict(String? providerID, String? districtID) {
    return dataSource.EnableDistrict(providerID, districtID);
  }

  @override
  Future<GetDistrictsData> GetAllDistricts() {
    return dataSource.GetAllDistricts();
  }

  @override
  Future<GetProviderDistricts> getProviderDistricts(String? providerID) {
    return dataSource.getProviderDistricts(providerID);
  }

  @override
  Future<AddDistrictData> AddDistrict(String? name) {
    return dataSource.AddDistrict(name);
  }

  @override
  Future<ChildrenServicesResponse> GetChildren(String? serviceID) {
    return dataSource.GetChildren(serviceID);
  }

  @override
  Future<ParentsServicesResponse> GetParents() {
    return dataSource.GetParents();
  }



}