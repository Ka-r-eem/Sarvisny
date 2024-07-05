import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../Provider/Provider.dart';
import '../../../domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import '../../Customer/CartUi/MyCartView.dart';
import 'Slots/SlotsListWidget.dart';

class WorkerProfilePage extends StatelessWidget {
  WorkerPersonalDetails? details;

  WorkerProfilePage({this.details});

  @override
  Widget build(BuildContext context) {
    var approvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<ColorProvider>(
                    builder: (context, provider, child) => Text(
                      details?.userName ?? "",
                      style: TextStyle(
                        color: provider.isDarkEnabled()
                            ? Colors.white
                            : Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.pushNamed(context, SlotsListWidget.routeName);

                        },
                        heroTag: 'Slots',
                        elevation: 0,
                        label: const Text("Slots",),
                        icon: const Icon(Icons.schedule_rounded),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'Orders',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Orders" , style: TextStyle(color: Colors.white),),
                        icon: const Icon(Icons.request_page ,color: Colors.white,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                   Text("Wallet Details", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary ,fontSize: 24),),
                  const SizedBox(height: 16),
                  _ProfileInfoRow(
                    items: [
                      ProfileInfoItem("Pending", details!.wallet!.pendingBalance!.toDouble()),
                      ProfileInfoItem("Handed", details!.wallet!.handedBalance!.toDouble()),
                      ProfileInfoItem("Total", details!.wallet!.totalBalance!.toDouble()),
                    ],
                   )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {

  _ProfileInfoRow({required List<ProfileInfoItem> items}) : _items = items;
  final List<ProfileInfoItem> _items ;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, provider, child) => Container(
        height: 80,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _items
              .map((item) => Expanded(
                      child: Row(
                    children: [
                      if (_items.indexOf(item) != 0) const VerticalDivider(),
                      Expanded(child: _singleItem(context, item, provider)),
                    ],
                  )))
              .toList(),
        ),
      ),
    );
  }

  Widget _singleItem(
          BuildContext context, ProfileInfoItem item, ColorProvider provider) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: TextStyle(
                color: provider.isDarkEnabled() ? Colors.white : Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            item.title,
            style: TextStyle(
              color: provider.isDarkEnabled() ? Colors.white : Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final double value;

  ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/cr7.jpg')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child:IconButton(icon: const Icon(Icons.camera_alt_rounded), onPressed: () {  },),

                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
