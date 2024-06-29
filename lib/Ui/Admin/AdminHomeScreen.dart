import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ColorProvider.dart';
import 'AdminCustomerUi/CustomersListView.dart';
import 'AdminDistrictsUi/DistrictsListView.dart';
import 'AdminOrdersUi/OrdersScreen.dart';
import 'AdminServiceUi/ServicesListView.dart';
import 'AdminSettingsUi/AdminSettingsScreen.dart';
import 'AdminWorkerUi/AdminWorkersHome.dart';
import 'HomeDrawer.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = "AdminHome";

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedWidget = ServicesListWidget();
  }

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      drawer: HomeDrawer(onMenuItemClick),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          colorProvider.changeTheme();
        }, icon: colorProvider.isDarkEnabled()?const Icon(Icons.sunny):const Icon(Icons.dark_mode))],
        title: Image.asset(
            colorProvider.isDarkEnabled()
                ? "assets/images/LogoNoContainerDark.png"
                : "assets/images/LogoNoContainerLight.png",
            height: 30),
        shape: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 5)),
      ),
      body: selectedWidget,
    );
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.customers:
        {
          selectedWidget = CustomerListView();
        }
      case MenuItem.settings:
        {
          selectedWidget = const AdminSettingsScreen();
        }
      case MenuItem.services:
        {
          selectedWidget = ServicesListWidget();
        }
      case MenuItem.workers:
        {
          selectedWidget = AdminWorkersHome();
        }
      case MenuItem.schedules:
        {
          selectedWidget = OrdersScreen();
        }
      case MenuItem.districts:
        selectedWidget = DistrictsListWidget();
    }
    setState(() {});
  }

// void onCategoryItemClick(Category category) {
//   selectedWidget = CategoryDetails(category);
//   setState(() {});
// }

//   List<Widget> tabs = [
//     AdminSchedulesScreen(),
//     AdminServicesScreen(),
//     AdminWorkersListScreen(),
//     AdminCustomersListScreen(),
//   ];
// }
}
