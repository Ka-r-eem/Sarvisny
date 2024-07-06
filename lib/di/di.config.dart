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
import '../data/DataSourceContract/AdminDataSource.dart' as _i49;
import '../data/DataSourceContract/CustomerDataSource.dart' as _i16;
import '../data/DataSourceContract/WorkerDataSource.dart' as _i39;
import '../data/dataSourceImpl/AdminDataSourceImpl.dart' as _i50;
import '../data/dataSourceImpl/CustomerDataSourceImpl.dart' as _i17;
import '../data/dataSourceImpl/WorkerDataSourceImpl.dart' as _i40;
import '../data/RepositoryImpl/AdminRepositoryImpl.dart' as _i52;
import '../data/RepositoryImpl/CustomerRepositoryImpl.dart' as _i21;
import '../data/RepositoryImpl/WorkerRepositoryImpl.dart' as _i42;
import '../domain/RepositoryContract/AdminRepository.dart' as _i51;
import '../domain/RepositoryContract/CustomerRepository.dart' as _i20;
import '../domain/RepositoryContract/WorkerRepository.dart' as _i41;
import '../domain/UseCases/AdminUseCases/AddCriteriaUseCase.dart' as _i92;
import '../domain/UseCases/AdminUseCases/AddDistrictUseCase.dart' as _i93;
import '../domain/UseCases/AdminUseCases/AddServiceToCriteriaUseCase.dart'
    as _i94;
import '../domain/UseCases/AdminUseCases/AddServiceUseCase.dart' as _i95;
import '../domain/UseCases/AdminUseCases/AddWorkerToDistrictUseCase.dart'
    as _i96;
import '../domain/UseCases/AdminUseCases/ApproveWorkerUseCase.dart' as _i55;
import '../domain/UseCases/AdminUseCases/BlockWorkerUseCase.dart' as _i57;
import '../domain/UseCases/AdminUseCases/DisableProviderDistrictUseCase.dart'
    as _i62;
import '../domain/UseCases/AdminUseCases/EnableProviderDistrictUseCase.dart'
    as _i63;
import '../domain/UseCases/AdminUseCases/GetAllDistrictsUseCase.dart' as _i23;
import '../domain/UseCases/AdminUseCases/getApprovedOrdersUseCase.dart' as _i6;
import '../domain/UseCases/AdminUseCases/getCancelledOrdersUseCase.dart' as _i8;
import '../domain/UseCases/AdminUseCases/GetChildrenForServiceUseCase.dart'
    as _i66;
import '../domain/UseCases/AdminUseCases/getCustomersUseCase.dart' as _i19;
import '../domain/UseCases/AdminUseCases/getExpiredOrdersUseCase.dart' as _i10;
import '../domain/UseCases/AdminUseCases/GetParentsUseCase.dart' as _i68;
import '../domain/UseCases/AdminUseCases/GetProviderDistricts.dart' as _i69;
import '../domain/UseCases/AdminUseCases/getRejectedOrdersUseCase.dart' as _i14;
import '../domain/UseCases/AdminUseCases/getRequestedOrdersUseCase.dart'
    as _i12;
import '../domain/UseCases/AdminUseCases/getWorkersUseCase.dart' as _i45;
import '../domain/UseCases/AdminUseCases/RejectWorkerUseCase.dart' as _i77;
import '../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart' as _i80;
import '../domain/UseCases/AdminUseCases/ShowAllOrdersUseCase.dart' as _i4;
import '../domain/UseCases/AdminUseCases/ShowAllRequestsUseCase.dart' as _i47;
import '../domain/UseCases/AdminUseCases/ShowFilteredWorkersUseCase.dart'
    as _i81;
import '../domain/UseCases/AdminUseCases/ShowServicesUseCase.dart' as _i82;
import '../domain/UseCases/AdminUseCases/UnBlockWorkerUseCase.dart' as _i84;
import '../domain/UseCases/CustomerUseCases/AddToCartUseCase.dart' as _i48;
import '../domain/UseCases/CustomerUseCases/CustomerRegisterUseCase.dart'
    as _i61;
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
import '../domain/UseCases/WorkerUseCases/AllOrdersUseCase.dart' as _i53;
import '../domain/UseCases/WorkerUseCases/ApprovedOrdersUseCase.dart' as _i56;
import '../domain/UseCases/WorkerUseCases/ApproveOrderUseCase.dart' as _i54;
import '../domain/UseCases/WorkerUseCases/CancelOrderUseCase.dart' as _i58;
import '../domain/UseCases/WorkerUseCases/GetOrderDetailsUseCase.dart' as _i67;
import '../domain/UseCases/WorkerUseCases/GetRegisteredServicesUseCase.dart'
    as _i70;
import '../domain/UseCases/WorkerUseCases/GetWorkerImageUseCase.dart' as _i71;
import '../domain/UseCases/WorkerUseCases/PendingOrdersUseCase.dart' as _i74;
import '../domain/UseCases/WorkerUseCases/RegisterNewServiceUseCase.dart'
    as _i75;
import '../domain/UseCases/WorkerUseCases/RejectOrderUseCase.dart' as _i76;
import '../domain/UseCases/WorkerUseCases/RemoveAvailabilityUseCase.dart'
    as _i78;
import '../domain/UseCases/WorkerUseCases/SetAvailabilityUseCase.dart' as _i79;
import '../domain/UseCases/WorkerUseCases/UploadFileUseCase.dart' as _i85;
import '../domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart' as _i89;
import '../domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart' as _i43;
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
import '../Ui/Admin/AdminServiceUi/ServiceListViewModel.dart' as _i99;
import '../Ui/Admin/AdminWorkerUi/WorkersList/WorkersListViewModel.dart'
    as _i44;
import '../Ui/Admin/AdminWorkerUi/WorkersRequests/WorkersRequestsViewModel.dart'
    as _i46;
import '../Ui/Customer/CartUi/MyCartViewModel.dart' as _i72;
import '../Ui/Customer/CriteriaUi/CriteriaListViewModel.dart' as _i98;
import '../Ui/Customer/FavouriteUi/CustomerFavProvidersViewModel.dart' as _i59;
import '../Ui/Customer/MyAccountUI/CustomerProfileViewModel.dart' as _i60;
import '../Ui/Customer/OrdersUi/OrderListViewModel.dart' as _i35;
import '../Ui/Customer/ServiceUi/AllServices/ServicesViewModel.dart' as _i38;
import '../Ui/Customer/ServiceUi/ChildrenServices/ChildrenViewModel.dart'
    as _i97;
import '../Ui/Customer/ServiceUi/FilteredServices/FilteredServicesViewModel.dart'
    as _i64;
import '../Ui/Customer/WorkerUI/FilteredWorkers/FilteredWorkersViewModel.dart'
    as _i65;
import '../Ui/Worker/Dashboard%20UI/WorkerDashboardViewModel.dart' as _i100;
import '../Ui/Worker/MyAccountUi/Slots/SlotsListViewModel.dart' as _i83;
import '../Ui/Worker/MyAccountUi/WorkerProfileViewModel.dart' as _i90;
import '../Ui/Worker/OrdersUi/AllOrders/WorkerAllOrdersViewModel.dart' as _i86;
import '../Ui/Worker/OrdersUi/ApprovedOrders/WorkerApprovedOrdersViewModel.dart'
    as _i87;
import '../Ui/Worker/OrdersUi/OrderWidgets/OrderDetailsViewModel.dart' as _i73;
import '../Ui/Worker/OrdersUi/PendingOrders/WorkerPendingOrdersViewModel.dart'
    as _i88;
import '../Ui/Worker/ServicesUi/WorkerServicesListViewModel.dart' as _i91;

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
    gh.factory<_i38.ServicesViewModel>(
        () => _i38.ServicesViewModel(gh<_i33.GetServicesListUseCase>()));
    gh.factory<_i39.WorkerDataSource>(
        () => _i40.WorkerDataSourceImpl(gh<_i15.ApiManager>()));
    gh.factory<_i41.WorkerRepository>(
        () => _i42.WorkerRepositoryImpl(gh<_i39.WorkerDataSource>()));
    gh.factory<_i43.WorkerSlotsUseCase>(
        () => _i43.WorkerSlotsUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i44.WorkersListViewModel>(
        () => _i44.WorkersListViewModel(gh<_i45.getWorkersUseCase>()));
    gh.factory<_i46.WorkersRequestsViewModel>(
        () => _i46.WorkersRequestsViewModel(gh<_i47.ShowAllRequestsUseCase>()));
    gh.factory<_i48.AddToCartUseCase>(
        () => _i48.AddToCartUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i49.AdminDataSource>(
        () => _i50.AdminDataSourceImpl(gh<_i15.ApiManager>()));
    gh.factory<_i51.AdminRepository>(
        () => _i52.AdminRepositoryImpl(gh<_i49.AdminDataSource>()));
    gh.factory<_i53.AllOrdersUseCase>(
        () => _i53.AllOrdersUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i54.ApproveOrderUseCase>(
        () => _i54.ApproveOrderUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i55.ApproveWorkerUseCase>(
        () => _i55.ApproveWorkerUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i56.ApprovedOrdersUseCase>(
        () => _i56.ApprovedOrdersUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i57.BlockWorkerUseCase>(
        () => _i57.BlockWorkerUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i58.CancelOrderUseCase>(
        () => _i58.CancelOrderUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i59.CustomerFavProvidersViewModel>(() =>
        _i59.CustomerFavProvidersViewModel(gh<_i25.GetCustomerFavsUseCase>()));
    gh.factory<_i60.CustomerProfileViewModel>(
        () => _i60.CustomerProfileViewModel(gh<_i30.GetProfileUseCase>()));
    gh.factory<_i61.CustomerRegisterUseCase>(
        () => _i61.CustomerRegisterUseCase(gh<_i20.CustomerRepository>()));
    gh.factory<_i62.DisableDistrictUseCase>(
        () => _i62.DisableDistrictUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i63.EnableDistrictUseCase>(
        () => _i63.EnableDistrictUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i64.FilteredServicesViewModel>(() =>
        _i64.FilteredServicesViewModel(gh<_i26.GetFilteredServicesUseCase>()));
    gh.factory<_i65.FilteredWorkersViewModel>(() =>
        _i65.FilteredWorkersViewModel(gh<_i32.GetServiceWorkersUseCase>()));
    gh.factory<_i23.GetAllDistrictsUseCase>(
        () => _i23.GetAllDistrictsUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i66.GetChildrenUseCase>(
        () => _i66.GetChildrenUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i67.GetOrderDetailsUseCase>(
        () => _i67.GetOrderDetailsUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i68.GetParentsUseCase>(
        () => _i68.GetParentsUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i69.GetProviderDistrictsUseCase>(
        () => _i69.GetProviderDistrictsUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i70.GetRegisteredServicesUseCase>(
        () => _i70.GetRegisteredServicesUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i71.GetWorkerImageUseCase>(
        () => _i71.GetWorkerImageUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i72.MyCartViewModel>(() => _i72.MyCartViewModel(
          gh<_i34.OrderCartUseCase>(),
          gh<_i37.RemoveFromCartUseCase>(),
          gh<_i24.GetCartUseCase>(),
        ));
    gh.factory<_i73.OrderDetailsViewModel>(
        () => _i73.OrderDetailsViewModel(gh<_i67.GetOrderDetailsUseCase>()));
    gh.factory<_i74.PendingOrdersUseCase>(
        () => _i74.PendingOrdersUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i75.RegisterNewServiceUseCase>(
        () => _i75.RegisterNewServiceUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i76.RejectOrderUseCase>(
        () => _i76.RejectOrderUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i77.RejectWorkerUseCase>(
        () => _i77.RejectWorkerUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i78.RemoveAvailabilityUseCase>(
        () => _i78.RemoveAvailabilityUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i79.SetAvailabilityUseCase>(
        () => _i79.SetAvailabilityUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i80.ShowAllCriteriasUseCase>(
        () => _i80.ShowAllCriteriasUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i4.ShowAllOrdersUseCase>(
        () => _i4.ShowAllOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i47.ShowAllRequestsUseCase>(
        () => _i47.ShowAllRequestsUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i81.ShowFilteredWorkersUseCase>(
        () => _i81.ShowFilteredWorkersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i82.ShowServicesUseCase>(
        () => _i82.ShowServicesUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i83.SlotsListViewModel>(
        () => _i83.SlotsListViewModel(gh<_i43.WorkerSlotsUseCase>()));
    gh.factory<_i84.UnBlockWorkerUseCase>(
        () => _i84.UnBlockWorkerUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i85.UploadFileUseCase>(
        () => _i85.UploadFileUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i86.WorkerAllOrdersViewModel>(
        () => _i86.WorkerAllOrdersViewModel(gh<_i53.AllOrdersUseCase>()));
    gh.factory<_i87.WorkerApprovedOrdersViewModel>(() =>
        _i87.WorkerApprovedOrdersViewModel(gh<_i56.ApprovedOrdersUseCase>()));
    gh.factory<_i88.WorkerPendingOrdersViewModel>(() =>
        _i88.WorkerPendingOrdersViewModel(gh<_i74.PendingOrdersUseCase>()));
    gh.factory<_i89.WorkerProfileUseCase>(
        () => _i89.WorkerProfileUseCase(gh<_i41.WorkerRepository>()));
    gh.factory<_i90.WorkerProfileViewModel>(() => _i90.WorkerProfileViewModel(
          gh<_i89.WorkerProfileUseCase>(),
          gh<_i71.GetWorkerImageUseCase>(),
        ));
    gh.factory<_i91.WorkerServicesListViewModel>(() =>
        _i91.WorkerServicesListViewModel(
            gh<_i70.GetRegisteredServicesUseCase>()));
    gh.factory<_i6.getApprovedOrdersUseCase>(
        () => _i6.getApprovedOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i8.getCancelledOrdersUseCase>(
        () => _i8.getCancelledOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i19.getCustomersUseCase>(
        () => _i19.getCustomersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i10.getExpiredOrdersUseCase>(
        () => _i10.getExpiredOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i14.getRejectedOrdersUseCase>(
        () => _i14.getRejectedOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i12.getRequestedOrdersUseCase>(
        () => _i12.getRequestedOrdersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i45.getWorkersUseCase>(
        () => _i45.getWorkersUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i92.AddCriteriaUseCase>(
        () => _i92.AddCriteriaUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i93.AddDistrictUseCase>(
        () => _i93.AddDistrictUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i94.AddServiceToCriteriaUseCase>(
        () => _i94.AddServiceToCriteriaUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i95.AddServiceUseCase>(
        () => _i95.AddServiceUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i96.AddWorkerToDistrictUseCase>(
        () => _i96.AddWorkerToDistrictUseCase(gh<_i51.AdminRepository>()));
    gh.factory<_i97.ChildrenServicesViewModel>(
        () => _i97.ChildrenServicesViewModel(gh<_i66.GetChildrenUseCase>()));
    gh.factory<_i98.CriteriaListViewModel>(() => _i98.CriteriaListViewModel(
          gh<_i80.ShowAllCriteriasUseCase>(),
          gh<_i68.GetParentsUseCase>(),
        ));
    gh.factory<_i99.ServiceListViewModel>(() => _i99.ServiceListViewModel(
          gh<_i82.ShowServicesUseCase>(),
          gh<_i95.AddServiceUseCase>(),
          gh<_i92.AddCriteriaUseCase>(),
          gh<_i94.AddServiceToCriteriaUseCase>(),
          gh<_i80.ShowAllCriteriasUseCase>(),
        ));
    gh.factory<_i100.WorkerDashboardViewModel>(
        () => _i100.WorkerDashboardViewModel(
              gh<_i89.WorkerProfileUseCase>(),
              gh<_i74.PendingOrdersUseCase>(),
            ));
    return this;
  }
}
