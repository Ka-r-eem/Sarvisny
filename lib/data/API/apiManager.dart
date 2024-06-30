import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/Responses/WorkerRelatedDto/RemoveAvailabilityResponseDto.dart';
import '../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../domain/model/AdminRelatedResponses/CriteriaData.dart';
import '../Responses/AdminRelatedDto/AddDistrictData.dart';
import '../Responses/AdminRelatedDto/AddProviderToDistrictDto.dart';
import '../Responses/AdminRelatedDto/AddServiceData.dart';
import '../Responses/AdminRelatedDto/Block_UnBlock_ServiceProvidersResponse.dart';
import '../Responses/AdminRelatedDto/CriteriaData.dart';
import '../Responses/AdminRelatedDto/CriteriasListResponse.dart';
import '../Responses/AdminRelatedDto/Enable_Disable_DistrictsForProviderDto.dart';
import '../Responses/AdminRelatedDto/GetDistrictsDataDto.dart';
import '../Responses/AdminRelatedDto/GetProviderDistrictsDto.dart';
import '../Responses/AdminRelatedDto/OrdersResponse.dart';
import '../Responses/AdminRelatedDto/ServicesListResponse.dart';
import '../Responses/CustomerRelatedDto/AddToCartResponse.dart';
import '../Responses/CustomerRelatedDto/CustomerOrdersLogResponse.dart';
import '../Responses/CustomerRelatedDto/CustomerProfileData.dart';
import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';
import '../Responses/CustomerRelatedDto/CustomerServicesListResponse.dart';
import '../Responses/CustomerRelatedDto/CustomersListResponse.dart';
import '../Responses/CustomerRelatedDto/FilteredServicesResponse.dart';
import '../Responses/CustomerRelatedDto/GetCartResponse.dart';
import '../Responses/CustomerRelatedDto/GetServiceWorkersResponse.dart';
import '../Responses/CustomerRelatedDto/OrderCartResponse.dart';
import '../Responses/CustomerRelatedDto/RemoveFromCartResponse.dart';
import '../Responses/LoginUserData.dart';
import '../Responses/WorkerRelatedDto/Approve_Reject_Cancel_OrderResponse.dart';
import '../Responses/WorkerRelatedDto/RegisterNewServiceResponse.dart';
import '../Responses/WorkerRelatedDto/ServiceProviderProfileData.dart';
import '../Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../Responses/WorkerRelatedDto/ShowOrderDetailsResponse.dart';
import '../Responses/WorkerRelatedDto/WorkerOrdersListResponse.dart';
import '../Responses/WorkerRelatedDto/WorkerRegisterData.dart';
import '../Responses/WorkerRelatedDto/WorkerRegisteredServicesResponse.dart';
import '../Responses/WorkerRelatedDto/WorkerSlotsResponseData.dart';
import '../Responses/WorkerRelatedDto/WorkersListResponse.dart';
import '../Responses/WorkerRelatedDto/WorkersRequestsResponse.dart';
import 'ApiPaths/AdminPaths/AdminApiPaths.dart';
import 'ApiPaths/CustomerPaths/CustomerApiPaths.dart';
import 'ApiPaths/WorkerPaths/WorkerApiPaths.dart';


@singleton
@injectable
class ApiManager {


  static const int port = 7188;
  static const String ipAddress = "10.0.2.2";
  static const String loginPath = "/api/auth/login";



  static Future<dynamic> Login(LoginUserData data) async {
    try {
      var url = Uri.https('$ipAddress:$port', loginPath);

      var requestBody = {
        'email': data.email,
        'password': data.password,
      };
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future<dynamic> registerCustomer(CustomerRegisterDataDto data) async {
    try {
      var url = Uri.https('$ipAddress:$port',
          CustomerApiPaths.customerRegistrationPath, {'role': 'Customer'});

      var requestBody = {
        'userName': data.userName,
        'email': data.email,
        'password': data.password,
        'firstName': data.firstName,
        'lastName': data.lastName,
        'phoneNumber': data.phoneNumber,
        'address': data.address,
      };
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

  static Future<dynamic> registerWorker(WorkerRegisterDataDto data) async {
    try {
      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.workerRegistrationPath, {'role': 'Serviceprovider'});

      var requestBody = {
        'userName': data.userName,
        'email': data.email,
        'password': data.password,
        'firstName': data.firstName,
        'lastName': data.lastName,
        'phoneNumber': data.phoneNumber,
        'nationalID': data.nationalID,
        "userType" : "Worker" ,
        'criminalRecord': data.criminalRecord
      };
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future<CustomersListResponseDto?> GetCustomersList() async {
    try {
      var url =
          Uri.https('$ipAddress:$port', AdminApiPaths.AdminGetCustomersPath);
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return CustomersListResponseDto.fromJson(responseBody);
    } catch (error) {
      return CustomersListResponseDto(isError: true);
    }
  }

   Future<WorkersListResponseDto?> GetWorkersList() async {
    try {
      var url = Uri.https(
          '$ipAddress:$port', AdminApiPaths.AdminGetServiceProvidersPath);
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return WorkersListResponseDto.fromJson(responseBody);
    } catch (error) {
      return WorkersListResponseDto(isError: true);
    }
  }

   Future<ServicesListResponseDto?> GetServicesList() async {
    try {
      var url =
          Uri.https('$ipAddress:$port', AdminApiPaths.AdminGetServicesPath);
      print(url);
      print("inside the api manager");
      var response = await http.get(url);
      print(response.statusCode);
      var responseBody = jsonDecode(response.body);
      print("inside the api manager");
      print(response);
      return ServicesListResponseDto.fromJson(responseBody);
    }
    catch (error) {

      return ServicesListResponseDto(isError: true);
    }
  }

   Future<WorkersRequestsResponseDto?> GetRequestsList() async {
    try {
      var url =
          Uri.https('$ipAddress:$port', AdminApiPaths.AdminGetRequestsPath);
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return WorkersRequestsResponseDto.fromJson(responseBody);
    } catch (error) {
      return WorkersRequestsResponseDto(isError: true, payload: []);
    }
  }

   Future<CriteriaListResponseDto?> GetCriteriasList() async {
    try {
      var url = Uri.https('$ipAddress:$port', AdminApiPaths.GetAllCriteraiPath);
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return CriteriaListResponseDto.fromJson(responseBody);
    } catch (error) {
      return CriteriaListResponseDto(isError: true, payload: []);
    }
  }

   Future<dynamic> ApproveWorker(String? WorkerID) async {
    try {
      var url = Uri.https('$ipAddress:$port', AdminApiPaths.AdminApprovePath,
          {'WorkerID': WorkerID});

      var response = await http.post(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future<dynamic> RejectWorker(String? WorkerID) async {
    try {
      var url = Uri.https('$ipAddress:$port', AdminApiPaths.AdminRejectPath,
          {'WorkerID': WorkerID});

      var response = await http.post(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future <CriteriaDataDto>addCriteria(CriteriaData criteriaData) async {

    print("at the beging");
    try {
      print("inside the api manager");
      var url = Uri.https('$ipAddress:$port', AdminApiPaths.addCriteriaPath);

      var requestBody = {
        'criteriaName': criteriaData.criteriaName,
        'description': criteriaData.description,
      };
      print("before response");
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      print("before response body");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      return responseBody;
    } catch (error) {
      return CriteriaDataDto(criteriaName: "invalid");
    }
  }

   Future<dynamic> addService(AddServiceData addServiceData) async {
    try {
      print("inside api of add service ");
      var url = Uri.https('$ipAddress:$port', AdminApiPaths.AddServicePath);

      var requestBody = {
        'serviceName': addServiceData.payload?.serviceName,
        'description': addServiceData.payload?.description,
        // 'price': addServiceData.payload?.price,
        // 'availabilityStatus': addServiceData.payload?.availabilityStatus,
      };
      print(requestBody);
      print(url);
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future<dynamic> addServiceToCriteria(
      String? CriteriaID, String? ServiceID) async {
    try {
      final queryParameters = {
        'criteriaId': CriteriaID,
        'serviceId': ServiceID,
      };
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.AddServiceToCriteriaPath, queryParameters);
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (error) {
      return false;
    }
  }

   Future<CustomerServicesListResponseDto?>
      GetServicesListForCustomer() async {
    try {
      var url = Uri.https('$ipAddress:$port', CustomerApiPaths.GetServicePath);
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return CustomerServicesListResponseDto.fromJson(responseBody);
    } catch (error) {
      return CustomerServicesListResponseDto(isError: true);
    }
  }

   Future<FilteredServicesResponseDto?> GetCriteriaServices(
      String? Id) async {
    try {
      var url = Uri.https(
          '$ipAddress:$port', '${CustomerApiPaths.GetServicesByCriteria}$Id');
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return FilteredServicesResponseDto.fromJson(responseBody);
    } catch (error) {
      return FilteredServicesResponseDto(isError: true);
    }
  }

   Future<SetAvailabilityResponseDto> SetAvailability(String? workerID, SetAvailabilityResponseDto setAvailabilityResponse) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.SetAvailabiltyPath,
        {'workerID': workerID},
      );

      var requestBody = {
        "dayOfWeek": setAvailabilityResponse.payload?.dayOfWeek,
        "availabilityDate": setAvailabilityResponse.payload?.availabilityDate,
        "slots": [
          {
            "startTime":
                setAvailabilityResponse.payload?.slots?.first.startTime,
            "endTime": setAvailabilityResponse.payload?.slots?.first.endTime
          }
        ]
      };

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return SetAvailabilityResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return SetAvailabilityResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return SetAvailabilityResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<RemoveAvailabilityResponseDto> RemoveAvailability(String? workerID, String? availabilityID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.RemoveAvailability,
        {'providerId': workerID , 'availabilityId' : availabilityID},
      );
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return RemoveAvailabilityResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return RemoveAvailabilityResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return RemoveAvailabilityResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<WorkerSlotsResponseDataDto?> GetWorkerSlots(String? Id) async {
    try {
      var url = Uri.https(
          '$ipAddress:$port', '${WorkerApiPaths.GetWorkerSlotsPath}$Id');
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return WorkerSlotsResponseDataDto.fromJson(responseBody);
    } catch (error) {
      return WorkerSlotsResponseDataDto(isError: true);
    }
  }

   Future<GetServiceWorkersResponseDto> GetServiceWorkers(
      String? serviceID) async {
    try {
      var queryParams = {
        'serviceId': serviceID,
      };

      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetAllWorkersForService, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return GetServiceWorkersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return GetServiceWorkersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return GetServiceWorkersResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<AddToCartResponseDto> AddToCart(
      context,
      String? customerID,
      String? providerID,
      String? serviceID,
      String? slotID,
      String? des) async {
    try {
      String date = DateTime.now().toString().substring(0, 10);
      var url = Uri.https('$ipAddress:$port', CustomerApiPaths.AddToCartPath,
          {'customerId': customerID});

      var requestBody = {
        'providerId': providerID,
        'serviceId': serviceID,
        'slotID': slotID,
        "districtID": "194b039d-b95d-4c4c-8074-78b942144e99" ,
        'requestDay': date,
        'problemDescription': des,
      };
      print(serviceID);
      print("inside api before response");
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      return AddToCartResponseDto.fromJson(responseBody);
    } catch (error) {
      return AddToCartResponseDto(isError: true);
    }
  }

   Future<GetCartResponseDto?> GetCart(String? Id) async {
    try {
      var url = Uri.https(
          '$ipAddress:$port', CustomerApiPaths.GetCartPath, {'customerId': Id});
      var response = await http.get(
        url,
      );
      var responseBody = jsonDecode(response.body);
      return GetCartResponseDto.fromJson(responseBody);
    } catch (error) {
      return GetCartResponseDto(isError: true);
    }
  }

   Future<OrderCartResponseDto> OrderCart(String? customerID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.OrderCartPath,
        {'customerId': customerID},
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrderCartResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrderCartResponseDto(isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrderCartResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<CustomerOrdersLogResponseDto> GetCustomerOrders(
      String? customerID) async {
    try {
      print("inside the api manager");

      var url = Uri.https('$ipAddress:$port',
          "${CustomerApiPaths.GetCustomerOrdersPath}$customerID");

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        print(response.statusCode);
        var responseBody = jsonDecode(response.body);
        return CustomerOrdersLogResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return CustomerOrdersLogResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return CustomerOrdersLogResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<RemoveFromCartResponseDto> RemoveFromCart(
      String? customerID, String? RequestID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.RemoveFromCartPath,
        {
          'customerId': customerID,
          'requestId': RequestID,
        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return RemoveFromCartResponseDto.fromJson(responseBody);
    } catch (error) {
      return RemoveFromCartResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<CustomerProfileDataDto> GetCustomerProfile(
      String? customerID) async {
    try {
      print(customerID);
      // var queryParams = {
      //   'customerId': customerID,
      // };

      var url = Uri.https('$ipAddress:$port',
          "${CustomerApiPaths.GetCustomerProfilePath}$customerID");

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      print(url);
      print(response.body);
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return CustomerProfileDataDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return CustomerProfileDataDto(isError: true, message: "Empty response");
      }
    } catch (error) {
      return CustomerProfileDataDto(isError: true, message: "$error");
    }
  }

   Future<ServiceProviderProfileDataDto> GetWorkerProfile(
      String? WorkerID) async {
    try {
      var queryParams = {
        'providerId' : WorkerID,
      };

      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.GetProfile , queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return ServiceProviderProfileDataDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return ServiceProviderProfileDataDto(isError: true, message: "Empty response");
      }
    } catch (error) {
      return ServiceProviderProfileDataDto(isError: true, message: "Error occurred");
    }
  }

   Future<WorkerRegisteredServicesResponseDto> GetRegisteredServices(
      String? workerID) async {
    try {
      var queryParams = {
        'providerID': workerID,
      };

      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.GetRegisteredServicesPath, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return WorkerRegisteredServicesResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return WorkerRegisteredServicesResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return WorkerRegisteredServicesResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<RegisterNewServiceResponseDto> RegisterNewService(
      String? workerID, String? serviceID, double? price) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.RegisterServicePath,
        {
          'workerId': workerID,
          'serviceId': serviceID,
          'price': price.toString(),
        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return RegisterNewServiceResponseDto.fromJson(responseBody);
    } catch (error) {
      return RegisterNewServiceResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<WorkerOrdersListResponseDto> GetAllWorkerOrders(
      String? workerID) async {
    try {
      var queryParams = {
        'providerID': workerID,
      };

      var url = Uri.https(
          '$ipAddress:$port', WorkerApiPaths.GetAllOrders, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return WorkerOrdersListResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return WorkerOrdersListResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return WorkerOrdersListResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<WorkerOrdersListResponseDto> GetApprovedWorkerOrders(
      String? workerID) async {
    try {
      var queryParams = {
        'providerID': workerID,
      };

      var url = Uri.https(
          '$ipAddress:$port', WorkerApiPaths.GetAllApprovedOrders, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return WorkerOrdersListResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return WorkerOrdersListResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return WorkerOrdersListResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<WorkerOrdersListResponseDto> GetPendingWorkerOrders(
      String? workerID) async {
    try {
      var queryParams = {
        'providerID': workerID,
      };

      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.GetAllRequestedOrders, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return WorkerOrdersListResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return WorkerOrdersListResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return WorkerOrdersListResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<ShowOrderDetailsResponseDto> GetOrderDetails(
      String? orderID) async {
    try {
      var queryParams = {
        'orderId': orderID,
      };

      var url = Uri.https(
          '$ipAddress:$port', WorkerApiPaths.ShowOrderDetails, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return ShowOrderDetailsResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return ShowOrderDetailsResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return ShowOrderDetailsResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<ApproveRejectCancelOrderResponseDto> ApproveOrder(
      String? orderID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.ApproveOrder,
        {
          'orderId': orderID,
        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return ApproveRejectCancelOrderResponseDto.fromJson(responseBody);
    } catch (error) {
      return ApproveRejectCancelOrderResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<ApproveRejectCancelOrderResponseDto> RejectOrder(
      String? orderID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.RejectOrder,
        {
          'orderId': orderID,
        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return ApproveRejectCancelOrderResponseDto.fromJson(responseBody);
    } catch (error) {
      return ApproveRejectCancelOrderResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<ApproveRejectCancelOrderResponseDto> CancelOrder(
      String? orderID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        WorkerApiPaths.CancelOrder,
        {
          'orderId': orderID,
        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return ApproveRejectCancelOrderResponseDto.fromJson(responseBody);
    } catch (error) {
      return ApproveRejectCancelOrderResponseDto(
          isError: true, message: "Error occurred");
    }
  }

   Future<BlockUnBlockServiceProvidersResponseDto> BlockProvider (String? providerID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        AdminApiPaths.BlockProviderPath,
        {
          'workerId': providerID,

        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return BlockUnBlockServiceProvidersResponseDto.fromJson(responseBody);
    } catch (error) {
      return BlockUnBlockServiceProvidersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<BlockUnBlockServiceProvidersResponseDto> UnBlockProvider (String? providerID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        AdminApiPaths.UnBlockProviderPath,
        {
          'workerId': providerID,

        },
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      return BlockUnBlockServiceProvidersResponseDto.fromJson(responseBody);
    } catch (error) {
      return BlockUnBlockServiceProvidersResponseDto(isError: true, message: "Error occurred");
    }
  }

   Future<OrdersResponseDto> GetAllOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetAllOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);
      print("Response Body of All Orders $responseBody");
      return OrdersResponseDto.fromJson(responseBody);
    } catch (error) {
      return OrdersResponseDto(isError: true);
    }
  }
   Future<OrdersResponseDto> GetAllApprovedOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetApprovedOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrdersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrdersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrdersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<OrdersResponseDto> GetAllRequestedOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetRequestedOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrdersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrdersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrdersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<OrdersResponseDto> GetAllCancelledOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetCancelledOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrdersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrdersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrdersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<OrdersResponseDto> GetAllRejectedOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetRejectedOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrdersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrdersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrdersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<OrdersResponseDto> GetAllExpiredOrdersForAdmin() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetExpiredOrdersPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return OrdersResponseDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return OrdersResponseDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrdersResponseDto(isError: true, message: "Error occurred");
    }
  }
   Future<AddDistrictDataDto> AddDistrict(String? name) async {
    try {
      var queryParams = {
        'districtName': name,
      };

      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.AddDistrictPath, queryParams);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return AddDistrictDataDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return AddDistrictDataDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return AddDistrictDataDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<GetDistrictsDataDto> GetAllDistricts() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetAllDistrictsPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return GetDistrictsDataDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return GetDistrictsDataDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return GetDistrictsDataDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<GetProviderDistrictsDto> GetProviderDistricts(String? providerID) async {
    try {
      var url = Uri.https('$ipAddress:$port',
          "${AdminApiPaths.GetProviderDistrictsPath}$providerID");

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return GetProviderDistrictsDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return GetProviderDistrictsDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return GetProviderDistrictsDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<AddProviderToDistrictDto> AddWorkerToDistrict(String? providerID , String? districtID) async {
    try {
      var queryParams = {
        'districtID': districtID,
      };
      var url = Uri.https('$ipAddress:$port',
          "${AdminApiPaths.AddProviderToDistrictPath}$providerID",queryParams);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return AddProviderToDistrictDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return AddProviderToDistrictDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return AddProviderToDistrictDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<EnableDisableDistrictsForProviderDto> EnableDistrict(String? providerID , String? districtID) async {
    try {
      var queryParams = {
        'districtID': districtID,
      };
      var url = Uri.https('$ipAddress:$port',
          "${AdminApiPaths.EnableDistrictPath}$providerID",queryParams);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return EnableDisableDistrictsForProviderDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return EnableDisableDistrictsForProviderDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return EnableDisableDistrictsForProviderDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<EnableDisableDistrictsForProviderDto> DisableDistrict(String? providerID , String? districtID) async {
    try {
      var queryParams = {
        'districtID': districtID,
      };
      var url = Uri.https('$ipAddress:$port',
          "${AdminApiPaths.DisableDistrictPath}$providerID",queryParams);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return EnableDisableDistrictsForProviderDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return EnableDisableDistrictsForProviderDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return EnableDisableDistrictsForProviderDto(
          isError: true, message: "Error occurred$error");
    }
  }


}





class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
