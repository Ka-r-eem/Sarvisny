import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ColorProvider.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  HomeDrawer(this.onMenuItemClick, {super.key});

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    return Drawer(
      child: Container(
        color: colorProvider.isDarkEnabled() ? Colors.black : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: colorProvider.isDarkEnabled()
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),
                padding: const EdgeInsets.symmetric(
                  vertical: 48,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  colorProvider.isDarkEnabled()
                      ? "assets/images/LogoNoContainerDark.png"
                      : "assets/images/LogoNoContainerLight.png",
                  width: 250,
                )),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.services);
              },
              child: Row(
                children: [
                  Icon(Icons.miscellaneous_services_rounded,
                      size: 32,
                      color: colorProvider.isDarkEnabled()
                          ? Colors.white
                          : Colors.black),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),
                    child: Text(
                      'Services',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.workers);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.home_repair_service,
                    size: 32,
                    color: colorProvider.isDarkEnabled()
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),
                    child: Text(
                      'Workers',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.customers);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.people_alt_sharp,
                    size: 32,
                    color: colorProvider.isDarkEnabled()
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),
                    child: Text(
                      'Customers',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.schedules);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 32,
                    color: colorProvider.isDarkEnabled()
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),

                    child: Text(
                      'Orders',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,
                      size: 32,
                      color: colorProvider.isDarkEnabled()
                          ? Colors.white
                          : Colors.black),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),

                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.districts);
              },
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 32,
                      color: colorProvider.isDarkEnabled()
                          ? Colors.white
                          : Colors.black),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onPrimary))),

                    child: Text(
                      'Districts',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorProvider.isDarkEnabled()
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuItem { services, workers, customers, schedules, settings , districts }
