// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/API/apiManager.dart' as _i15;
import '../data/DataSourceContract/AdminDataSource.dart' as _i51;
import '../data/DataSourceContract/CustomerDataSource.dart' as _i16;
import '../data/DataSourceContract/WorkerDataSource.dart' as _i40;
import '../data/dataSourceImpl/AdminDataSourceImpl.dart' as _i52;
import '../data/dataSourceImpl/CustomerDataSourceImpl.dart' as _i17;
import '../data/dataSourceImpl/WorkerDataSourceImpl.dart' as _i41;
import '../data/RepositoryImpl/AdminRepositoryImpl.dart' as _i54;
import '../data/RepositoryImpl/CustomerRepositoryImpl.dart' as _i21;
import '../data/RepositoryImpl/WorkerRepositoryImpl.dart' as _i43;
import '../domain/RepositoryContract/AdminRepository.dart' as _i53;
import '../domain/RepositoryContract/CustomerRepository.dart' as _i20;
import '../domain/RepositoryContract/WorkerRepository.dart' as _i42;
import '../domain/UseCases/AdminUseCases/AddCriteriaUseCase.dart' as _i94;
import '../domain/UseCases/AdminUseCases/AddDistrictUseCase.dart' as _i95;
import '../domain/UseCases/AdminUseCases/AddServiceToCriteriaUseCase.dart'
    as _i96;
import '../domain/UseCases/AdminUseCases/AddServiceUseCase.dart' as _i97;
import '../domain/UseCases/AdminUseCases/AddWorkerToDistrictUseCase.dart'
    as _i98;
import '../domain/UseCases/AdminUseCases/ApproveWorkerUseCase.dart' as _i57;
import '../domain/UseCases/AdminUseCases/BlockWorkerUseCase.dart' as _i59;
import '../domain/UseCases/AdminUseCases/DisableProviderDistrictUseCase.dart'
    as _i64;
import '../domain/UseCases/AdminUseCases/EnableProviderDistrictUseCase.dart'
    as _i65;
import '../domain/UseCases/AdminUseCases/GetAllDistrictsUseCase.dart' as _i23;
import '../domain/UseCases/AdminUseCases/getApprovedOrdersUseCase.dart' as _i6;
import '../domain/UseCases/AdminUseCases/getCancelledOrdersUseCase.dart' as _i8;
import '../domain/UseCases/AdminUseCases/GetChildrenForServiceUseCase.dart'
    as _i68;
import '../domain/UseCases/AdminUseCases/getCustomersUseCase.dart' as _i19;
import '../domain/UseCases/AdminUseCases/getExpiredOrdersUseCase.dart' as _i10;
import '../domain/UseCases/AdminUseCases/GetParentsUseCase.dart' as _i70;
import '../domain/UseCases/AdminUseCases/GetProviderDistricts.dart' as _i71;
import '../domain/UseCases/AdminUseCases/getRejectedOrdersUseCase.dart' as _i14;
import '../domain/UseCases/AdminUseCases/getRequestedOrdersUseCase.dart'
    as _i12;
import '../domain/UseCases/AdminUseCases/getWorkersUseCase.dart' as _i46;
import '../domain/UseCases/AdminUseCases/RejectWorkerUseCase.dart' as _i79;
import '../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart' as _i82;
import '../domain/UseCases/AdminUseCases/ShowAllOrdersUseCase.dart' as _i4;
import '../domain/UseCases/AdminUseCases/ShowAllRequestsUseCase.dart' as _i48;
import '../domain/UseCases/AdminUseCases/ShowFilteredWorkersUseCase.dart'
    as _i83;
import '../domain/UseCases/AdminUseCases/ShowServicesUseCase.dart' as _i84;
import '../domain/UseCases/AdminUseCases/UnBlockWorkerUseCase.dart' as _i86;
import '../domain/UseCases/CustomerUseCases/AddProviderToFavUseCase.dart'
    as _i49;
import '../domain/UseCases/CustomerUseCases/AddToCartUseCase.dart' as _i50;
import '../domain/UseCases/CustomerUseCases/CustomerRegisterUseCase.dart'
    as _i63;
import '../domain/UseCases/CustomerUseCases/GetCartUseCase.dart' as _i24;
import '../domain/UseCases/CustomerUseCases/GetCustomerFavsUseCase.dart'
    as _i25;
import '../domain/UseCases/CustomerUseCases/GetFilteredServicesUseCase.dart'
    as _i26;
import '../domain/UseCases/CustomerUseCases/GetFirstMatchedUseCase.dart'
    as _i27;
import '../domain/UseCases/CustomerUseCases/GetMatchedUseCase.dart' as _i28;
import '../domain/UseCases/CustomerUseCases/GetOrdersUseCase.dart' as _i29;
import '../domain/UseCases/CustomerUseCases/GetProfileUseCase.dart' as _i30;
import '../domain/UseCases/CustomerUseCases/GetSecondMatchedUseCase.dart'
    as _i31;
import '../domain/UseCases/CustomerUseCases/GetServicesListUseCase.dart'
    as _i33;
import '../domain/UseCases/CustomerUseCases/GetServiceWorkersUseCase.dart'
    as _i32;
import '../domain/UseCases/CustomerUseCases/OrderCartUseCase.dart' as _i34;
import '../domain/UseCases/CustomerUseCases/PayTransactionUseCase.dart' as _i36;
import '../domain/UseCases/CustomerUseCases/RemoveFromCartUseCase.dart' as _i37;
import '../domain/UseCases/CustomerUseCases/RemoveProviderFromFavUseCase.dart'
    as _i38;
import '../domain/UseCases/WorkerUseCases/AllOrdersUseCase.dart' as _i55;
import '../domain/UseCases/WorkerUseCases/ApprovedOrdersUseCase.dart' as _i58;
import '../domain/UseCases/WorkerUseCases/ApproveOrderUseCase.dart' as _i56;
import '../domain/UseCases/WorkerUseCases/CancelOrderUseCase.dart' as _i60;
import '../domain/UseCases/WorkerUseCases/GetOrderDetailsUseCase.dart' as _i69;
import '../domain/UseCases/WorkerUseCases/GetRegisteredServicesUseCase.dart'
    as _i72;
import '../domain/UseCases/WorkerUseCases/GetWorkerImageUseCase.dart' as _i73;
import '../domain/UseCases/WorkerUseCases/PendingOrdersUseCase.dart' as _i76;
import '../domain/UseCases/WorkerUseCases/RegisterNewServiceUseCase.dart'
    as _i77;
import '../domain/UseCases/WorkerUseCases/RejectOrderUseCase.dart' as _i78;
import '../domain/UseCases/WorkerUseCases/RemoveAvailabilityUseCase.dart'
    as _i80;
import '../domain/UseCases/WorkerUseCases/SetAvailabilityUseCase.dart' as _i81;
import '../domain/UseCases/WorkerUseCases/UploadFileUseCase.dart' as _i87;
import '../domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart' as _i91;
import '../domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart' as _i44;
import '../Ui/Admin/AdminCustomerUi/CustomerListViewModel.dart' as _i18;
import '../Ui/Admin/AdminDistrictsUi/DistrictsListViewModel.dart' as _i22;
import '../Ui/Admin/AdminOrdersUi/AllOrders/AdminAllOrdersViewModel.dart'
    as _i3;
import '../Ui/Admin/AdminOrdersUi/ApprovedOrders/AdminApprovedOrdersViewModel.dart'
    as _i5;
import '../Ui/Admin/AdminOrdersUi/CancelledOrders/AdminCancelledOrdersViewModel.dart'
    as _i7;
import '../Ui/Admin/AdminOrdersUi/ExpiredOrders/AdminExpiredOrdersViewModel.dart'
    as _i9;
import '../Ui/Admin/AdminOrdersUi/PendingOrders/AdminPendingOrdersViewModel.dart'
    as _i11;
import '../Ui/Admin/AdminOrdersUi/RejectedOrders/AdminRejectedOrdersViewModel.dart'
    as _i13;
import '../Ui/Admin/AdminServiceUi/ServiceListViewModel.dart' as _i101;
import '../Ui/Admin/AdminWorkerUi/WorkersList/WorkersListViewModel.dart'
    as _i45;
import '../Ui/Admin/AdminWorkerUi/WorkersRequests/WorkersRequestsViewModel.dart'
    as _i47;
import '../Ui/Customer/CartUi/MyCartViewModel.dart' as _i74;
import '../Ui/Customer/CriteriaUi/CriteriaListViewModel.dart' as _i100;
import '../Ui/Customer/FavouriteUi/CustomerFavProvidersViewModel.dart' as _i61;
import '../Ui/Customer/MyAccountUI/CustomerProfileViewModel.dart' as _i62;
import '../Ui/Customer/OrdersUi/OrderListViewModel.dart' as _i35;
import '../Ui/Customer/ServiceUi/AllServices/ServicesViewModel.dart' as _i39;
import '../Ui/Customer/ServiceUi/ChildrenServices/ChildrenViewModel.dart'
    as _i99;
import '../Ui/Customer/ServiceUi/FilteredServices/FilteredServicesViewModel.dart'
    as _i66;
import '../Ui/Customer/WorkerUI/FilteredWorkers/FilteredWorkersViewModel.dart'
    as _i67;
import '../Ui/Worker/Dashboard%20UI/WorkerDashboardViewModel.dart' as _i102;
import '../Ui/Worker/MyAccountUi/Slots/SlotsListViewModel.dart' as _i85;
import '../Ui/Worker/MyAccountUi/WorkerProfileViewModel.dart' as _i92;
import '../Ui/Worker/OrdersUi/AllOrders/WorkerAllOrdersViewModel.dart' as _i88;
import '../Ui/Worker/OrdersUi/ApprovedOrders/WorkerApprovedOrdersViewModel.dart'
    as _i89;
import '../Ui/Worker/OrdersUi/OrderWidgets/OrderDetailsViewModel.dart' as _i75;
import '../Ui/Worker/OrdersUi/PendingOrders/WorkerPendingOrdersViewModel.dart'
    as _i90;
import '../Ui/Worker/ServicesUi/WorkerServicesListViewModel.dart' as _i93;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AdminAllOrdersViewModel>(
        () => _i3.AdminAllOrdersViewModel(gh<_i4.ShowAllOrdersUseCase>()));
    gh.factory<_i5.AdminApprovedOrdersViewModel>(() =>
        _i5.AdminApprovedOrdersViewModel(gh<_i6.getApprovedOrdersUseCase>()));
    gh.factory<_i7.AdminCancelledOrdersViewModel>(() =>
        _i7.AdminCancelledOrdersViewModel(gh<_i8.getCancelledOrdersUseCase>()));
    gh.factory<_i9.AdminExpiredOrdersViewModel>(() =>
        _i9.AdminExpiredOrdersViewModel(gh<_i10.getExpiredOrdersUseCase>()));
    gh.factory<_i11.AdminPendingOrdersViewModel>(() =>
        _i11.AdminPendingOrdersViewModel(gh<_i12.getRequestedOrdersUseCase>()));
    gh.factory<_i13.AdminRejectedOrdersViewModel>(() =>
        _i13.AdminRejectedOrdersViewModel(gh<_i14.getRejectedOrdersUseCase>()));
    gh.singleton<_i15.ApiManager>(() => _i15.ApiManager());
    gh.factory<_i16.CustomerDataSource>(
        () => _i17.CustomerDataSourceimpl(gh<_i15.ApiManager>()));
    gh.factory<_i18.CustomerListViewModel>(
        () => _i18.CustomerListViewModel(gh<_i19.getCustomersUseCase>()));
    gh.factory<_i20.CustomerRepository>(
        () => _i21.CustomerRepositoryImpl(gh<_i16.CustomerDataSource>()));
    gh.factory<_i22.DistrictsListViewModel>(
        () => _i22.DistrictsListViewModel(gh<_i23.GetAllDistrictsUseCase>()));
    gh.factory<_i24.GetCartUseCase>(
        () => _i24.GetCartUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i25.GetCustomerFavsUseCase>(
        () => _i25.GetCustomerFavsUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i26.GetFilteredServicesUseCase>(
        () => _i26.GetFilteredServicesUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i27.GetFirstMatchedUseCase>(
        () => _i27.GetFirstMatchedUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i28.GetMatchedUseCase>(
        () => _i28.GetMatchedUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i29.GetOrderUseCase>(
        () => _i29.GetOrderUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i30.GetProfileUseCase>(
        () => _i30.GetProfileUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i31.GetSecondMatchedUseCase>(
        () => _i31.GetSecondMatchedUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i32.GetServiceWorkersUseCase>(
        () => _i32.GetServiceWorkersUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i33.GetServicesListUseCase>(
        () => _i33.GetServicesListUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i34.OrderCartUseCase>(
        () => _i34.OrderCartUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i35.OrderListViewModel>(
        () => _i35.OrderListViewModel(gh<_i29.GetOrderUseCase>()));
    gh.factory<_i36.PayTransactionUseCase>(
        () => _i36.PayTransactionUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i37.RemoveFromCartUseCase>(
        () => _i37.RemoveFromCartUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i38.RemoveProviderFromFavUseCase>(
        () => _i38.RemoveProviderFromFavUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i39.ServicesViewModel>(
        () => _i39.ServicesViewModel(gh<_i33.GetServicesListUseCase>()));
    gh.factory<_i40.WorkerDataSource>(
        () => _i41.WorkerDataSourceImpl(gh<_i15.ApiManager>()));
    gh.factory<_i42.WorkerRepository>(
        () => _i43.WorkerRepositoryImpl(gh<_i40.WorkerDataSource>()));
    gh.factory<_i44.WorkerSlotsUseCase>(
        () => _i44.WorkerSlotsUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i45.WorkersListViewModel>(
        () => _i45.WorkersListViewModel(gh<_i46.getWorkersUseCase>()));
    gh.factory<_i47.WorkersRequestsViewModel>(
        () => _i47.WorkersRequestsViewModel(gh<_i48.ShowAllRequestsUseCase>()));
    gh.factory<_i49.AddProviderToFavUseCase>(
        () => _i49.AddProviderToFavUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i50.AddToCartUseCase>(
        () => _i50.AddToCartUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i51.AdminDataSource>(
        () => _i52.AdminDataSourceImpl(gh<_i15.ApiManager>()));
    gh.factory<_i53.AdminRepository>(
        () => _i54.AdminRepositoryImpl(gh<_i51.AdminDataSource>()));
    gh.factory<_i55.AllOrdersUseCase>(
        () => _i55.AllOrdersUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i56.ApproveOrderUseCase>(
        () => _i56.ApproveOrderUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i57.ApproveWorkerUseCase>(
        () => _i57.ApproveWorkerUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i58.ApprovedOrdersUseCase>(
        () => _i58.ApprovedOrdersUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i59.BlockWorkerUseCase>(
        () => _i59.BlockWorkerUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i60.CancelOrderUseCase>(
        () => _i60.CancelOrderUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i61.CustomerFavProvidersViewModel>(() =>
        _i61.CustomerFavProvidersViewModel(gh<_i25.GetCustomerFavsUseCase>()));
    gh.factory<_i62.CustomerProfileViewModel>(
        () => _i62.CustomerProfileViewModel(gh<_i30.GetProfileUseCase>()));
    gh.factory<_i63.CustomerRegisterUseCase>(
        () => _i63.CustomerRegisterUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i64.DisableDistrictUseCase>(
        () => _i64.DisableDistrictUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i65.EnableDistrictUseCase>(
        () => _i65.EnableDistrictUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i66.FilteredServicesViewModel>(() =>
        _i66.FilteredServicesViewModel(gh<_i26.GetFilteredServicesUseCase>()));
    gh.factory<_i67.FilteredWorkersViewModel>(() =>
        _i67.FilteredWorkersViewModel(gh<_i32.GetServiceWorkersUseCase>()));
    gh.factory<_i23.GetAllDistrictsUseCase>(
        () => _i23.GetAllDistrictsUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i68.GetChildrenUseCase>(
        () => _i68.GetChildrenUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i69.GetOrderDetailsUseCase>(
        () => _i69.GetOrderDetailsUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i70.GetParentsUseCase>(
        () => _i70.GetParentsUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i71.GetProviderDistrictsUseCase>(
        () => _i71.GetProviderDistrictsUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i72.GetRegisteredServicesUseCase>(
        () => _i72.GetRegisteredServicesUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i73.GetWorkerImageUseCase>(
        () => _i73.GetWorkerImageUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i74.MyCartViewModel>(() => _i74.MyCartViewModel(
          gh<_i34.OrderCartUseCase>(),
          gh<_i37.RemoveFromCartUseCase>(),
          gh<_i24.GetCartUseCase>(),
        ));
    gh.factory<_i75.OrderDetailsViewModel>(
        () => _i75.OrderDetailsViewModel(gh<_i69.GetOrderDetailsUseCase>()));
    gh.factory<_i76.PendingOrdersUseCase>(
        () => _i76.PendingOrdersUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i77.RegisterNewServiceUseCase>(
        () => _i77.RegisterNewServiceUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i78.RejectOrderUseCase>(
        () => _i78.RejectOrderUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i79.RejectWorkerUseCase>(
        () => _i79.RejectWorkerUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i80.RemoveAvailabilityUseCase>(
        () => _i80.RemoveAvailabilityUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i81.SetAvailabilityUseCase>(
        () => _i81.SetAvailabilityUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i82.ShowAllCriteriasUseCase>(
        () => _i82.ShowAllCriteriasUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i4.ShowAllOrdersUseCase>(
        () => _i4.ShowAllOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i48.ShowAllRequestsUseCase>(
        () => _i48.ShowAllRequestsUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i83.ShowFilteredWorkersUseCase>(
        () => _i83.ShowFilteredWorkersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i84.ShowServicesUseCase>(
        () => _i84.ShowServicesUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i85.SlotsListViewModel>(
        () => _i85.SlotsListViewModel(gh<_i44.WorkerSlotsUseCase>()));
    gh.factory<_i86.UnBlockWorkerUseCase>(
        () => _i86.UnBlockWorkerUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i87.UploadFileUseCase>(
        () => _i87.UploadFileUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i88.WorkerAllOrdersViewModel>(
        () => _i88.WorkerAllOrdersViewModel(gh<_i55.AllOrdersUseCase>()));
    gh.factory<_i89.WorkerApprovedOrdersViewModel>(() =>
        _i89.WorkerApprovedOrdersViewModel(gh<_i58.ApprovedOrdersUseCase>()));
    gh.factory<_i90.WorkerPendingOrdersViewModel>(() =>
        _i90.WorkerPendingOrdersViewModel(gh<_i76.PendingOrdersUseCase>()));
    gh.factory<_i91.WorkerProfileUseCase>(
        () => _i91.WorkerProfileUseCase(gh<_i42.WorkerRepository>()));
    gh.factory<_i92.WorkerProfileViewModel>(() => _i92.WorkerProfileViewModel(
          gh<_i91.WorkerProfileUseCase>(),
          gh<_i73.GetWorkerImageUseCase>(),
        ));
    gh.factory<_i93.WorkerServicesListViewModel>(() =>
        _i93.WorkerServicesListViewModel(
            gh<_i72.GetRegisteredServicesUseCase>()));
    gh.factory<_i6.getApprovedOrdersUseCase>(
        () => _i6.getApprovedOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i8.getCancelledOrdersUseCase>(
        () => _i8.getCancelledOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i19.getCustomersUseCase>(
        () => _i19.getCustomersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i10.getExpiredOrdersUseCase>(
        () => _i10.getExpiredOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i14.getRejectedOrdersUseCase>(
        () => _i14.getRejectedOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i12.getRequestedOrdersUseCase>(
        () => _i12.getRequestedOrdersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i46.getWorkersUseCase>(
        () => _i46.getWorkersUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i94.AddCriteriaUseCase>(
        () => _i94.AddCriteriaUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i95.AddDistrictUseCase>(
        () => _i95.AddDistrictUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i96.AddServiceToCriteriaUseCase>(
        () => _i96.AddServiceToCriteriaUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i97.AddServiceUseCase>(
        () => _i97.AddServiceUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i98.AddWorkerToDistrictUseCase>(
        () => _i98.AddWorkerToDistrictUseCase(gh<_i53.AdminRepository>()));
    gh.factory<_i99.ChildrenServicesViewModel>(
        () => _i99.ChildrenServicesViewModel(gh<_i68.GetChildrenUseCase>()));
    gh.factory<_i100.CriteriaListViewModel>(() => _i100.CriteriaListViewModel(
          gh<_i82.ShowAllCriteriasUseCase>(),
          gh<_i70.GetParentsUseCase>(),
        ));
    gh.factory<_i101.ServiceListViewModel>(() => _i101.ServiceListViewModel(
          gh<_i84.ShowServicesUseCase>(),
          gh<_i97.AddServiceUseCase>(),
          gh<_i94.AddCriteriaUseCase>(),
          gh<_i96.AddServiceToCriteriaUseCase>(),
          gh<_i82.ShowAllCriteriasUseCase>(),
        ));
    gh.factory<_i102.WorkerDashboardViewModel>(
        () => _i102.WorkerDashboardViewModel(
              gh<_i91.WorkerProfileUseCase>(),
              gh<_i76.PendingOrdersUseCase>(),
            ));
    return this;
  }
}
