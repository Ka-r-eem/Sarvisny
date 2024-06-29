import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/MyAccountDetailsCard.dart';
import 'package:sarvisny/Provider/ColorProvider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Auth/Login.dart';
import 'package:sarvisny/Ui/Customer/CartUi/MyCartView.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';


class MyAccount extends StatelessWidget {
  CustomerProfileDetails? details;

  MyAccount({this.details});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<ColorProvider>(context);
    var approvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDarkEnabled() ? Colors.black : Colors.white54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Ahlan ${details?.firstName}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
          ),
          Container(
            color: provider.isDarkEnabled()? Colors.black : Colors.white,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("My Account", style: TextStyle(fontSize: 20 ,color: Theme.of(context).colorScheme.onPrimary)),
                ),

                // MyAccountDetailsCard("Fullname", "${details?.firstName} ${details?.lastName}"),
                MyAccountDetailsCard("Username", "${details?.userName}"),
                MyAccountDetailsCard("Email", "${details?.email}"),
                MyAccountDetailsCard("Address", "${details?.address}"),

              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Container(
            color: provider.isDarkEnabled()? Colors.black : Colors.white,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Settings", style: TextStyle(fontSize: 20 ,color: Theme.of(context).colorScheme.onPrimary)),
                ),

                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyCart.routeName);
                    },
                    child: MyAccountDetailsCard("My Cart",approvider.CartItems == 0 ? "No Items in Cart :(" : "There is ${approvider.CartItems} items in Cart" )),
                // MyAccountDetailsCard("Theme", provider.isDarkEnabled() ? "Dark Mode" : "Light Mode"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Theme.of(context).colorScheme.onPrimary),
              ),
              IconButton(onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              }, icon:Icon(Icons.logout , color: Theme.of(context).colorScheme.onPrimary,)),
            ],
          ),
        ],
      ),
    );
  }
}
