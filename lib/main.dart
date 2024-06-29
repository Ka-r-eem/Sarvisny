import 'dart:io';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyThemeData.dart';
import 'Provider/ColorProvider.dart';
import 'Provider/Provider.dart';
import 'Ui/Admin/AdminHomeScreen.dart';
import 'Ui/Admin/AdminServiceUi/ServicesListView.dart';
import 'Ui/Admin/AdminWorkerUi/WorkersList/WorkersListScreen.dart';
import 'Ui/Admin/AdminWorkerUi/WorkersRequests/RequestDetails.dart';
import 'Ui/Auth/ChooseUser.dart';
import 'Ui/Auth/Login.dart';
import 'Ui/Auth/CustomerRegister.dart';
import 'Ui/Auth/WorkerRegister.dart';
import 'Ui/Customer/CartUi/AddToCartScreen.dart';
import 'Ui/Customer/CartUi/CartListScreen.dart';
import 'Ui/Customer/CartUi/MyCartView.dart';
import 'Ui/Customer/CustomerHomeScreen.dart';
import 'Ui/Customer/OrdersUi/CustomerOrderDetailsScreen.dart';
import 'Ui/Customer/WorkerUI/WorkerDetailsScreen.dart';
import 'Ui/Worker/MyAccountUi/Slots/SlotsListScreen.dart';
import 'Ui/Worker/MyAccountUi/Slots/SlotsListWidget.dart';
import 'Ui/Worker/OrdersUi/OrderWidgets/OrderDetailsWidget.dart';
import 'Ui/Admin/AdminOrdersUi/OrderWidgets/OrderDetailsWidget.dart';
import 'Ui/Customer/WorkerUI/FilteredWorkers/ServiceWorkersListView.dart';
import 'Ui/Customer/ServiceUi/FilteredServices/FilteredCustomerServicesListView.dart';
import 'Ui/Worker/WorkerHomeScreen.dart';
import 'Ui/Worker/WorkerWaitingScreen.dart';
import 'data/API/apiManager.dart';
import 'di/di.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  var provider1 = AppProvider();
  var provider2 = ColorProvider();
  await provider2.loadSettingConfig();
  FilePicker.platform;
  configureDependencies();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
      ChangeNotifierProvider(create: (context) => provider2,child: ChangeNotifierProvider(create: (context) => provider1, child: const MyApp())),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);

    return MaterialApp(
      title: 'SARVISNY',

      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: colorProvider.currentTheme,
      routes: {
        ChooseUserType.routeName :(context) => ChooseUserType(),
        CustomerRegister.routeName: (context) => CustomerRegister(),
        LoginScreen.routeName:(context) => const LoginScreen(),
        CustomerHomeScreen.routeName : (context) => CustomerHomeScreen(),
        WorkerRegister.routeName :(context) =>  WorkerRegister(),
        // WorkersList.routeName :(context) => WorkersList(),
        AdminHomeScreen.routeName :(context) => AdminHomeScreen(),
        WorkersListScreen.routeName :(context) => WorkersListScreen(),
        RequestDetailsScreen.routeName :(context) => RequestDetailsScreen(),
        WorkerHomeScreen.routeName :(context) => WorkerHomeScreen(),
        FilteredCustomerServicesListWidget.routeName :(context) => FilteredCustomerServicesListWidget(),
        SlotsListWidget.routeName :(context) => SlotsListWidget(),
        ServiceWorkersListView.routeName :(context) => ServiceWorkersListView(),
        WorkerDetailsScreen.routeName : (context) => WorkerDetailsScreen(),
        AddToCartScreen.routeName:(context) => AddToCartScreen(),
        MyCart.routeName :(context) => MyCart(),
        OrderDetailsWidget.routeName : (context) => OrderDetailsWidget(),
        // AdminOrderDetailsWidget.routeName : (context) => AdminOrderDetailsWidget(),
        CustomerOrderDetailsScreen.routeName :(context) => CustomerOrderDetailsScreen(),
        CartListScreen.routeName : (context) => CartListScreen(),
        ServicesListWidget.routeName :(context) => ServicesListWidget(),
        SlotsListScreen.routeName : (context) => SlotsListScreen(),
        WorkerWaitingScreen.routeName :(context) => WorkerWaitingScreen()

         },
      initialRoute: LoginScreen.routeName,
    );
  }
}


