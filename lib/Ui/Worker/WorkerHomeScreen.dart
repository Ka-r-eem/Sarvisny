import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          colorProvider.changeTheme();
        }, icon: colorProvider.isDarkEnabled()?const Icon(Icons.sunny):const Icon(Icons.dark_mode))],
        title: Image.asset(
            colorProvider.isDarkEnabled()
                ? "assets/images/LogoNoContainerDark.png"
                : "assets/images/LogoNoContainerLight.png",
            height: 30),
        shape: UnderlineInputBorder(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 5)),

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: "My Account",
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    OrdersScreen(),
    WorkerServicesListWidget(),
    WorkerProfileWidget(),
  ];
}
