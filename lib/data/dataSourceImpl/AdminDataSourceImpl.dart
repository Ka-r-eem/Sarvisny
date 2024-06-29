import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/API/apiManager.dart';
import 'package:sarvisny/data/DataSourceContract/AdminDataSource.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/AddDistrictData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/AddProviderToDistrict.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriaData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/Enable_Disable_DistrictsForProvider.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetProviderDistricts.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomersListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';
import '../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../domain/model/AdminRelatedResponses/Block_UnBlock_ServiceProvidersResponse.dart';
import '../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../domain/model/AdminRelatedResponses/OrdersResponse.dart';
import '../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';



@Injectable(as: AdminDataSource)

class AdminDataSourceImpl extends AdminDataSource{

  ApiManager apiManager ;

  @factoryMethod
  AdminDataSourceImpl(this.apiManager); // constructor injection

  @override
  Future<List<WorkerListObject>?> getWorkers() async {

   var response = await apiManager.GetWorkersList();
   return response?.payload?.map((dto) => dto.toWorker()).toList();

  }

  @override
  Future AddService(AddServiceData data) async {
print("inside datasource impl");
    var response = await apiManager.addService(data);
    return response;

  }

  @override
  Future AddServiceToCriteria(CriteriaID, ServiceID) async{
    var response = await apiManager.addServiceToCriteria(CriteriaID, ServiceID);
    return response;
  }

  @override
  Future AdminApprove(WorkerID) async{
    var response = await apiManager.ApproveWorker(WorkerID);
    return response;
  }

  @override
  Future<List<CustomerListObject>?> AdminGetCustomers() async{
    var response = await apiManager.GetCustomersList();
    return response?.payload?.map((dto) => dto.toCustomer()).toList();
  }

  @override
  Future<List<WorkerRequest>?> AdminGetRequests() async{
    var response = await apiManager.GetRequestsList();
    return response?.payload?.map((dto) => dto.toRequest()).toList();
  }

  @override
  Future<List<ServiceObject>?> AdminGetServices() async{
    var response = await apiManager.GetServicesList();
    var servicesList =  response?.payload?.map((dto) => dto.toService()).toList();
    return servicesList;
  }

  @override
  Future AdminReject(WorkerID) async{
    var response = await apiManager.RejectWorker(WorkerID);
    return response;
  }

  @override
  Future<BlockUnBlockServiceProvidersResponse> BlockProvider(providerID) async{
    var response = await apiManager.BlockProvider(providerID);
    return response.toBlock();
  }

  @override
  Future<List<CriteriaObject>?> GetAllCriterai() async{
    var response = await apiManager.GetCriteriasList();
    return response?.payload?.map((dto) => dto.toCriteria()).toList();
  }

  @override
  Future <List<OrderResponse>?> GetAllOrders() async{
    var response = await apiManager.GetAllOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future<List<WorkerData>?> GetAllWorkersForService(serviceID)async{
    var response = await apiManager.GetServiceWorkers(serviceID);
    return response.payload?.map((dto) => dto.toServiceWorker()).toList();
  }

  @override
  Future  <List<OrderResponse>?> GetApprovedOrders()async {
    var response = await apiManager.GetAllApprovedOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future  <List<OrderResponse>?> GetRequestedOrders() async{
    var response = await apiManager.GetAllRequestedOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future<BlockUnBlockServiceProvidersResponse> UnBlockProvider(providerID) async{
    var response = await apiManager.UnBlockProvider(providerID);
    return response.toBlock();
  }

  @override
  Future<CriteriaData> addCriteria(criteriaData) async{
    print("inside data source impl ");
    var response = await apiManager.addCriteria(criteriaData);
    return response.toCriteria();
  }

  @override
  Future<List<OrderResponse>?> GetCancelledOrders() async{
    var response = await apiManager.GetAllCancelledOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future<List<OrderResponse>?> GetExpiredOrders() async{
    var response = await apiManager.GetAllExpiredOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future<List<OrderResponse>?> GetRejectedOrders()async {
    var response = await apiManager.GetAllRejectedOrdersForAdmin();
    return response.payload?.map((dto) => dto.toOrder()).toList();
  }

  @override
  Future<AddProviderToDistrict> AddWorkerToDistrict(String? providerID, String? districtID)async {
    var response = await apiManager.AddWorkerToDistrict(providerID, districtID);
    return response.toDistrict();
  }

  @override
  Future<EnableDisableDistrictsForProvider> DisableDistrict(String? providerID, String? districtID) async{
    var response = await apiManager.DisableDistrict(providerID, districtID);
    return response.toObject();
  }

  @override
  Future<EnableDisableDistrictsForProvider> EnableDistrict(String? providerID, String? districtID) async{
    var response = await apiManager.EnableDistrict(providerID, districtID);
    return response.toObject();
  }

  @override
  Future<GetDistrictsData> GetAllDistricts()async {
    var response = await apiManager.GetAllDistricts();
    return response.toDistricts();
  }

  @override
  Future<GetProviderDistricts> getProviderDistricts(String? providerID) async {
    var response = await apiManager.GetProviderDistricts(providerID);
    return response.toProviderDistricts();
  }

  @override
  Future<AddDistrictData> AddDistrict(String? name) async {
    var response = await apiManager.AddDistrict(name);
    return response.toDistrictData();
  }


}