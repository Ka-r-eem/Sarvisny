import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../Provider/Provider.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../CartUi/MyCartView.dart';

class ProfilePage extends StatelessWidget {
  final CustomerProfileDetails? details;

  ProfilePage({this.details});

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
                          if (approvider.token == null ||
                              approvider.token == "") {
                            dialoguUtilities.showmsg(
                                context, "Please Login First",
                                postAction: Navigator.of(context).pop,
                                pos: "Ok");
                          } else {
                            Navigator.pushNamed(context, MyCart.routeName);
                          }
                        },
                        heroTag: 'Cart',
                        elevation: 0,
                        label: const Text("Cart"),
                        icon: const Icon(Icons.shopping_cart),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'Favourites',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Favourites"),
                        icon: const Icon(Icons.favorite_outline_sharp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow()
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
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Orders", 11),
    ProfileInfoItem("Wallet", 500),
    ProfileInfoItem("Rate", 4.5),
  ];

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

  const ProfileInfoItem(this.title, this.value);
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
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: CircleAvatar(
                //     radius: 20,
                //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //     child: Container(
                //       margin: const EdgeInsets.all(8.0),
                //       decoration: const BoxDecoration(
                //           color: Colors.green, shape: BoxShape.circle),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
