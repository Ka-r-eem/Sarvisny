import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/API/apiManager.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/Approve_Reject_Cancel_OrderResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/RegisterNewServiceResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/RemoveAvailabilityResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import '../../domain/model/WorkerRelatedResponse/SetAvailabilityResponse.dart';
import '../DataSourceContract/WorkerDataSource.dart';
import '../Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';



@Injectable(as: WorkerDataSource)

class WorkerDataSourceImpl extends WorkerDataSource{

  ApiManager apiManager ;

  @factoryMethod
  WorkerDataSourceImpl(this.apiManager); // constructor injection

  @override
  Future<SetAvailabilityResponse?> SetAvailability(
      String? workerID, SetAvailabilityResponseDto setAvailabilityResponse)async {
    var response = await apiManager.SetAvailability(workerID, setAvailabilityResponse);
    return response.toSetAvailabilityResponse();
  }

  @override
  Future<ApproveRejectCancelOrderResponse> ApproveOrder(String? orderID) async{
    var response = await apiManager.ApproveOrder(orderID);
    return response.toARCorderResponse();
  }

  @override
  Future<ApproveRejectCancelOrderResponse> CancelOrder(String? orderID)async {
    var response = await apiManager.CancelOrder(orderID);
    return response.toARCorderResponse();
  }

  @override
  Future<WorkerOrdersListResponse> GetAllWorkerOrders(String? workerID)async {
    var response = await apiManager.GetAllWorkerOrders(workerID);
    return response.toResponse();
  }

  @override
  Future<WorkerOrdersListResponse> GetApprovedWorkerOrders(String? workerID) async {
    var response = await apiManager.GetApprovedWorkerOrders(workerID);
    return response.toResponse();
  }

  @override
  Future<ShowOrderDetailsResponse> GetOrderDetails(String? orderID) async {
    var response = await apiManager.GetOrderDetails(orderID);
    return response.toOrderDetails() ;
  }

  @override
  Future<WorkerOrdersListResponse> GetPendingWorkerOrders(String? workerID) async {
    var response = await apiManager.GetPendingWorkerOrders(workerID);
    return response.toResponse();
  }

  @override
  Future<WorkerRegisteredServicesResponse> GetRegisteredServices(String? workerID) async {
    var response = await apiManager.GetRegisteredServices(workerID);
    return response.toResponse();
  }

  @override
  Future<ServiceProviderProfileData> GetWorkerProfile(String? WorkerID)async {
    var response = await apiManager.GetWorkerProfile(WorkerID);
    return response.toServiceProviderProfileData();
  }

  @override
  Future<WorkerSlotsResponseData?> GetWorkerSlots(String? Id) async {
    var response = await apiManager.GetWorkerSlots(Id);
    return response?.toWorkerSlotsResponseData();
  }

  @override
  Future<RegisterNewServiceResponse> RegisterNewService(String? workerID, String? serviceID, double? price)async {
    var response = await apiManager.RegisterNewService(workerID, serviceID, price);
    return response.toRegisterNewServiceResponse();
  }

  @override
  Future<ApproveRejectCancelOrderResponse> RejectOrder(String? orderID)async {
    var response = await apiManager.RejectOrder(orderID);
    return response.toARCorderResponse();
  }

  @override
  Future<RemoveAvailabilityResponse> RemoveAvailability(String? providerID, String? availabilityID)async {
    var response = await apiManager.RemoveAvailability(providerID, availabilityID);
    return response.toRemoveAvailabilityResponse();
  }




}