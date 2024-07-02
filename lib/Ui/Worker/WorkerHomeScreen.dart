import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Ui/Worker/Dashboard%20UI/WorkerDashboardView.dart';
import 'package:sarvisny/Ui/Worker/MyAccountUi/WorkerProfileWidget.dart';
import 'package:sarvisny/Ui/Worker/OrdersUi/OrdersScreen.dart';
import 'package:sarvisny/Ui/Worker/ServicesUi/WorkerServicesListWidget.dart';

import '../../Provider/ColorProvider.dart';
import 'MyAccountUi/WorkerMyAccountScreen.dart';

class WorkerHomeScreen extends StatefulWidget {
  static const String routeName = "WorkerHome";

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  int selectedIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                colorProvider.changeTheme();
              },
              icon: colorProvider.isDarkEnabled()
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.dark_mode))
        ],
        title: Image.asset(
            colorProvider.isDarkEnabled()
                ? "assets/images/LogoNoContainerDark.png"
                : "assets/images/LogoNoContainerLight.png",
            height: 30),
        shape: UnderlineInputBorder(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 5)),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GNav(
            curve: Curves.easeInOut,
            color: Colors.white,
            tabBackgroundColor: Colors.white,
            activeColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(16),
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedIndex: selectedIndex,
            gap: 12,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.dashboard_outlined, text: "Dashboard" , textColor: Colors.green ,iconActiveColor: Colors.green),
              GButton(icon: Icons.list_alt_outlined, text: "Orders" ,textColor: Colors.red ,iconActiveColor: Colors.red),
              GButton(icon: Icons.miscellaneous_services, text: "Services"  ,textColor: Colors.purple ,iconActiveColor: Colors.purple),
              GButton(icon: Icons.account_circle_sharp, text: "Account", textColor: Colors.blue ,iconActiveColor: Colors.blue),


            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    WorkerDashboardView(),
    OrdersScreen(),
    WorkerServicesListWidget(),
    WorkerProfileWidget(),
  ];
}
