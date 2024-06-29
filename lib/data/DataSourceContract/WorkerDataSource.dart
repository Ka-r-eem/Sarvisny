import '../../domain/model/WorkerRelatedResponse/Approve_Reject_Cancel_OrderResponse.dart';
import '../../domain/model/WorkerRelatedResponse/RegisterNewServiceResponse.dart';
import '../../domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import '../../domain/model/WorkerRelatedResponse/SetAvailabilityResponse.dart';
import '../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import '../Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';

abstract class WorkerDataSource {
  Future<SetAvailabilityResponse?> SetAvailability(
      String? workerID, SetAvailabilityResponseDto setAvailabilityResponse);

  Future<WorkerSlotsResponseData?> GetWorkerSlots(String? Id);

  Future<ServiceProviderProfileData> GetWorkerProfile(String? WorkerID);

  Future<WorkerRegisteredServicesResponse> GetRegisteredServices(
      String? workerID);

  Future<RegisterNewServiceResponse> RegisterNewService(
      String? workerID, String? serviceID, double? price);

  Future<WorkerOrdersListResponse> GetAllWorkerOrders(String? workerID);

  Future<WorkerOrdersListResponse> GetApprovedWorkerOrders(String? workerID);

  Future<WorkerOrdersListResponse> GetPendingWorkerOrders(String? workerID);

  Future<ShowOrderDetailsResponse> GetOrderDetails(String? orderID);

  Future<ApproveRejectCancelOrderResponse> ApproveOrder(String? orderID);

  Future<ApproveRejectCancelOrderResponse> RejectOrder(String? orderID);

  Future<ApproveRejectCancelOrderResponse> CancelOrder(String? orderID);
}