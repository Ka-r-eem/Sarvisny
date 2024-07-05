class WorkerApiPaths{
  static const String workerRegistrationPath = "/api/Worker/register";
  static const String GetWorkerSlotsPath = "/api/ServiceProvider/getServiceProviderAvailability/";
  static const String SetAvailabiltyPath = "/api/ServiceProvider/setAvailability";
  static const String GetRegisteredServicesPath = "/api/ServiceProvider/getRegisteredServices";
  static const String RegisterServicePath = "/api/ServiceProvider/registerService";
  static const String GetAllOrders = "/api/ServiceProvider/getAllOrdersForProvider";
  static const String GetAllApprovedOrders = "/api/ServiceProvider/getAllApprovedOrders";
  static const String GetAllRequestedOrders = "/api/ServiceProvider/getAllRequestededOrders";
  static const String ShowOrderDetails = "/api/ServiceProvider/showOrderDetails";
  static const String ApproveOrder = "/api/ServiceProvider/approveOrderRequest";
  static const String RejectOrder = "/api/ServiceProvider/rejectOrderRequest";
  static const String CancelOrder = "/api/ServiceProvider/cancelOrderRequest";
  static const String GetProfile = "/api/ServiceProvider/showProviderProfile";
  static const String RemoveAvailability = "/api/ServiceProvider/removeAvailability";
  static const String UploadFilePath = "/api/Worker/uploadFile";
  static const String GetImagePath = "/api/Worker/getWorkerImage";
  // static const String AddRating = "/api/ServiceProvider/addProviderRating/{orderId}";
  // static const String GetRating = "/api/ServiceProvider/GetProviderRating/{orderId}";
  // static const String SetOrderStatus = "/api/ServiceProvider/setOrderStatus";

}
