import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:sarvisny/data/Responses/AdminRelatedDto/ParentsServicesDto.dart';
import 'package:sarvisny/data/Responses/LoginResponseData.dart';
import 'package:sarvisny/data/Responses/WorkerRelatedDto/RemoveAvailabilityResponseDto.dart';
import 'package:sarvisny/data/Responses/WorkerRelatedDto/WorkerRegisterResponseDto.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/PaymentTransactionResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/GetWorkerImageResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/UploadFileResponse.dart';
import '../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../domain/model/AdminRelatedResponses/CriteriaData.dart';
import '../../domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import '../../domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
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
import '../Responses/AdminRelatedDto/childrenServicesDto.dart';
import '../Responses/CustomerRelatedDto/AddToCartResponse.dart';
import '../Responses/CustomerRelatedDto/CustomerOrdersLogResponseDto.dart';
import '../Responses/CustomerRelatedDto/CustomerProfileData.dart';
import '../Responses/CustomerRelatedDto/CustomerRegisterData.dart';
import '../Responses/CustomerRelatedDto/CustomerServicesListResponse.dart';
import '../Responses/CustomerRelatedDto/CustomersListResponse.dart';
import '../Responses/CustomerRelatedDto/FilteredServicesResponse.dart';
import '../Responses/CustomerRelatedDto/GetCartResponseDto.dart';
import '../Responses/CustomerRelatedDto/GetServiceWorkersResponse.dart';
import '../Responses/CustomerRelatedDto/OrderCartResponseDto.dart';
import '../Responses/CustomerRelatedDto/RemoveFromCartResponse.dart';
import '../Responses/LoginUserData.dart';
import '../Responses/WorkerRelatedDto/Approve_Reject_Cancel_OrderResponse.dart';
import '../Responses/WorkerRelatedDto/RegisterNewServiceResponse.dart';
import '../Responses/WorkerRelatedDto/ServiceProviderProfileDataDto.dart';
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
      return LoginResponseData.fromJson(responseBody);
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
        'userType': "Customer",
        'address': data.address,
        'districtName': data.districtName
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
      };
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      var responseBody = jsonDecode(response.body);
      return WorkerRegisterResponseDto.fromJson(responseBody);
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
      print(responseBody);
      print('ServicesListResponseDto.fromJson(responseBody)');
      print(ServicesListResponseDto.fromJson(responseBody));
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
      List<String>? serviceIDs, // Changed to a list of service IDs
      String? slotID,
      String? districtID,
      String? address,
      String? des,
      String? requestDay
      ) async {
    try {
      // String date = DateTime.now().toIso8601String(); // Changed to ISO8601 format

      var url = Uri.https('$ipAddress:$port', CustomerApiPaths.AddToCartPath, {'customerId': customerID});

      var requestBody = {
        'providerId': providerID,
        'serviceIDs': serviceIDs, // Changed to an array
        'slotID': slotID,
        'districtID': districtID,
        'address': address,
        'requestDay': requestDay,
        'problemDescription': des,
      };
      print("Request Body: $requestBody");

      print(serviceIDs);
      print("inside api before response");

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      var responseBody = jsonDecode(response.body);
      print("responseBody: $responseBody");

      return AddToCartResponseDto.fromJson(responseBody);
    } catch (error) {
      return AddToCartResponseDto(message: "Error occurred$error");
    }
  }


  Future<GetCartResponse?> GetCart(String? Id) async {
    try {
      var url = Uri.https('$ipAddress:$port', CustomerApiPaths.GetCartPath, {'customerId': Id});
      var response = await http.get(url);
      var responseBody = jsonDecode(response.body);

      print('Response Body: $responseBody');

      try {
        GetCartResponse response = GetCartResponse.fromJson(responseBody);
        print('Parsed Response: ${response.message}');
        print('Cart ID: ${response.payload!.cartID}');
        return response;
      } catch (e) {
        print('Error parsing JSON: $e');
        return null; // Handle the error or throw it further if needed
      }
    } catch (error) {
      print('Error fetching cart: $error');
      return null; // Handle the error or throw it further if needed
    }
  }


  Future<OrderCartResponse?> OrderCart(String? customerID , String? paymentmethod) async {
    try {
      print("inside the api manager of order cart");
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.OrderCartPath,
        {'customerId': customerID , 'paymentMethod': paymentmethod},
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        try {
          OrderCartResponse response = OrderCartResponse.fromJson(responseBody);
          print('Parsed Response: ${response.message}');
          print('Cart ID: ${response.payload!}');
          return response;
        } catch (e) {
          print('Error parsing JSON: $e');
          return null; // Handle the error or throw it further if needed
        }

      } else {
        // Handle empty response
        return OrderCartResponse(isError: true, message: "Empty response");
      }
    } catch (error) {
      return OrderCartResponse(isError:true);
    }
  }
  Future<PaymentTransactionResponse> PayTrasaction(String? transactionID) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.PayTransactionPath,
        {'transactionID': transactionID},
      );

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        print("inside pay transaction");
        var responseBody = jsonDecode(response.body);
        return PaymentTransactionResponse.fromJson(responseBody);
      } else {
        // Handle empty response
        return PaymentTransactionResponse(isError: true, message: "Empty response");
      }
    } catch (error) {
      return PaymentTransactionResponse(isError: true, message: "Error occurred");
    }
  }

   Future<CustomerOrdersLogResponseDto?> GetCustomerOrders(
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
        print('inside api :$responseBody');

        try {
          CustomerOrdersLogResponseDto response = CustomerOrdersLogResponseDto.fromJson(responseBody);
          print('Parsed Response: ${response.message}');
          print('Cart ID: ${response.payload!}');
          print(response.payload?.first.orderId);
          return response;
        } catch (e) {
          print('Error parsing JSON: $e');
          return null; // Handle the error or throw it further if needed
        }
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

   Future<WorkerOrdersListResponseDto> GetPendingWorkerOrders(String? workerID) async {
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
   Future<GetWorkerImageResponse> GetWorkerImage(String? workerID) async {
    try {
      var queryParams = {
        'providerID': workerID,
      };

      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.GetImagePath, queryParams);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return GetWorkerImageResponse.fromJson(responseBody);
      } else {
        // Handle empty response
        return GetWorkerImageResponse(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return GetWorkerImageResponse(isError: true, message: "Error occurred");
    }
  }

   Future<ShowOrderDetailsResponseDto> GetOrderDetails(String? orderID) async {
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
   Future<GetCustomerFavResponse> GetCustomerFav(String? customerID) async {
    try {
      var url = Uri.https(
          '$ipAddress:$port', "${CustomerApiPaths.GetCustomerFavouritesPath}$customerID",);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return GetCustomerFavResponse.fromJson(responseBody);
      } else {
        // Handle empty response
        return GetCustomerFavResponse(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return GetCustomerFavResponse(isError: true, message: "Error occurred");
    }
  }
  Future<GetAllMatchedResponse> GetAllMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.GetAllMatchedProvidersPath, // Replace with your API path
      );

      var requestBody = jsonEncode({
        "services": [serviceId],
        "startTime": time,
        "dayOfWeek": day,
        "districtId": districtId,
        "customerId": customerId
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var responseBody = jsonDecode(response.body);
          print("responseBody : $responseBody");
          return GetAllMatchedResponse.fromJson(responseBody);
        } else {
          // Handle empty response
          return GetAllMatchedResponse(
            isError: true,
            message: "Empty response",
          );
        }
      } else {
        // Handle HTTP error
        return GetAllMatchedResponse(
          isError: true,
          message: "HTTP Error: ${response.statusCode}",
        );
      }
    } catch (error) {
      // Handle general error
      return GetAllMatchedResponse(
        isError: true,
        message: "Error occurred $error",
      );
    }
  }
  Future<GetFirstSecMatchedResponse> GetFirstMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.GetFirstSuggestedProviderPath, // Replace with your API path
      );

      var requestBody = jsonEncode({
        "services": [serviceId],
        "startTime": time,
        "dayOfWeek": day,
        "districtId": districtId,
        "customerId": customerId
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var responseBody = jsonDecode(response.body);
          print("responseBody : $responseBody");
          return GetFirstSecMatchedResponse.fromJson(responseBody);
        } else {
          // Handle empty response
          return GetFirstSecMatchedResponse(
            isError: true,
            message: "Empty response",
          );
        }
      } else {
        // Handle HTTP error
        return GetFirstSecMatchedResponse(
          isError: true,
          message: "HTTP Error: ${response.statusCode}",
        );
      }
    } catch (error) {
      // Handle general error
      return GetFirstSecMatchedResponse(
        isError: true,
        message: "Error occurred $error",
      );
    }
  }
  Future<GetFirstSecMatchedResponse> GetSecMatched(String? serviceId, String? day, String? time, String? districtId, String? customerId) async {
    try {
      var url = Uri.https(
        '$ipAddress:$port',
        CustomerApiPaths.GetSecondSuggestedProviderPath, // Replace with your API path
      );

      var requestBody = jsonEncode({
        "services": [serviceId],
        "startTime": time,
        "dayOfWeek": day,
        "districtId": districtId,
        "customerId": customerId
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var responseBody = jsonDecode(response.body);
          print("responseBody : $responseBody");
          return GetFirstSecMatchedResponse.fromJson(responseBody);
        } else {
          // Handle empty response
          return GetFirstSecMatchedResponse(
            isError: true,
            message: "Empty response",
          );
        }
      } else {
        // Handle HTTP error
        return GetFirstSecMatchedResponse(
          isError: true,
          message: "HTTP Error: ${response.statusCode}",
        );
      }
    } catch (error) {
      // Handle general error
      return GetFirstSecMatchedResponse(
        isError: true,
        message: "Error occurred $error",
      );
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
  Future<UploadFileResponse> UploadFile(String? fileName, String? providerID, String? base64Image) async {
    try {
      var queryParams = {
        'fileName': fileName,
        'providerId': providerID,
      };

      var url = Uri.https('$ipAddress:$port',
          WorkerApiPaths.UploadFilePath, queryParams);

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'base64Image': base64Image,
        }),
      );

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        print("inside api manager: $responseBody");
        return UploadFileResponse.fromJson(responseBody);
      } else {
        // Handle empty response
        return UploadFileResponse(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return UploadFileResponse(
          isError: true, message: "Error occurred: $error");
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
   Future<ParentsServicesDto> GetParents() async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetAllParentsPath);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      // print(response.body);
      // print('parent response body :${response.body.length}');
      // print('parent compare : ${parentCompare.length}');

      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        print(" ParentsServicesDto.fromJson(responseBody)");
        print (ParentsServicesDto.fromJson(responseBody));
        return ParentsServicesDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return ParentsServicesDto(
            isError: true, message: "Empty response");
      }
    } catch (error) {
      return ParentsServicesDto(
          isError: true, message: "Error occurred$error");
    }
  }
   Future<ChildrenServicesDto> GetChildren(String? serviceId) async {
    try {
      var url = Uri.https('$ipAddress:$port',
          AdminApiPaths.GetAllChildrenForServicePath , {'serviceId': serviceId},);

      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        return ChildrenServicesDto.fromJson(responseBody);
      } else {
        // Handle empty response
        return ChildrenServicesDto(
            isError: true, message: "Empty response");
      }

    } catch (error) {
      return ChildrenServicesDto(
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

