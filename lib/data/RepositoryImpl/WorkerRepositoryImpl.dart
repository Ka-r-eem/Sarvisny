
import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/Approve_Reject_Cancel_OrderResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/RegisterNewServiceResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/RemoveAvailabilityResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/SetAvailabilityResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/UploadFileResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';

import '../../domain/RepositoryContract/WorkerRepository.dart';
import '../DataSourceContract/WorkerDataSource.dart';


@Injectable(as: WorkerRepository)

class WorkerRepositoryImpl extends WorkerRepository {

  WorkerDataSource dataSource ;
  @factoryMethod WorkerRepositoryImpl(this.dataSource);

  @override
  Future<ApproveRejectCancelOrderResponse> ApproveOrder(String? orderID) {
    return dataSource.ApproveOrder(orderID);

  }

  @override
  Future<ApproveRejectCancelOrderResponse> CancelOrder(String? orderID) {
    return dataSource.CancelOrder(orderID);

  }

  @override
  Future<WorkerOrdersListResponse> GetAllWorkerOrders(String? workerID) {
  return dataSource.GetAllWorkerOrders(workerID);
  }

  @override
  Future<WorkerOrdersListResponse> GetApprovedWorkerOrders(String? workerID) {
  return dataSource.GetApprovedWorkerOrders(workerID);
  }

  @override
  Future<ShowOrderDetailsResponse> GetOrderDetails(String? orderID) {
    return dataSource.GetOrderDetails(orderID);
  }

  @override
  Future<WorkerOrdersListResponse> GetPendingWorkerOrders(String? workerID) {
    return dataSource.GetPendingWorkerOrders(workerID);
  }

  @override
  Future<WorkerRegisteredServicesResponse> GetRegisteredServices(String? workerID) {
    return dataSource.GetRegisteredServices(workerID);
  }

  @override
  Future<ServiceProviderProfileData> GetWorkerProfile(String? WorkerID) {
    return dataSource.GetWorkerProfile(WorkerID);
  }

  @override
  Future<WorkerSlotsResponseData?> GetWorkerSlots(String? Id) {
    return dataSource.GetWorkerSlots(Id);
  }

  @override
  Future<RegisterNewServiceResponse> RegisterNewService(String? workerID, String? serviceID, double? price) {
    return dataSource.RegisterNewService(workerID, serviceID, price);
  }

  @override
  Future<ApproveRejectCancelOrderResponse> RejectOrder(String? orderID) {
   return dataSource.RejectOrder(orderID);
  }

  @override
  Future<SetAvailabilityResponse?> SetAvailability(String? workerID, SetAvailabilityResponseDto setAvailabilityResponse) {
    return dataSource.SetAvailability(workerID, setAvailabilityResponse);
  }

  @override
  Future<RemoveAvailabilityResponse> RemoveAvailability(String? providerID, String? availabilityID) {
    return dataSource.RemoveAvailability(providerID, availabilityID);
  }

  @override
  Future<UploadFileResponse> UploadFile(String? fileName, String? providerID, String? base64Image) {
    return dataSource.UploadFile(fileName, providerID, base64Image);
  }

}