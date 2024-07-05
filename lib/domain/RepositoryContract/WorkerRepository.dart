
import '../../data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../model/WorkerRelatedResponse/Approve_Reject_Cancel_OrderResponse.dart';
import '../model/WorkerRelatedResponse/RegisterNewServiceResponse.dart';
import '../model/WorkerRelatedResponse/RemoveAvailabilityResponse.dart';
import '../model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import '../model/WorkerRelatedResponse/SetAvailabilityResponse.dart';
import '../model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import '../model/WorkerRelatedResponse/UploadFileResponse.dart';
import '../model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';
import '../model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';

abstract class WorkerRepository {
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

  Future<RemoveAvailabilityResponse> RemoveAvailability(String? providerID , String? availabilityID);
  Future<UploadFileResponse> UploadFile(String? fileName, String? providerID, String? base64Image);



}
