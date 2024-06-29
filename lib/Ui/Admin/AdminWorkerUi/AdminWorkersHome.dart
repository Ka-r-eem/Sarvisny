import 'package:flutter/material.dart';

import 'WorkersList/WorkersListView.dart';
import 'WorkersRequests/WorkersRequestsListView.dart';

class AdminWorkersHome extends StatefulWidget {
  const AdminWorkersHome({super.key});

  @override
  State<AdminWorkersHome> createState() => _AdminWorkersHomeState();
}

class _AdminWorkersHomeState extends State<AdminWorkersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: "Service Providers"),
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: "Requests"),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  int selectedIndex = 0;

  var tabs = [WorkersListView(), WorkersRequestListView()];
}
