import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../Provider/Provider.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../../../domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import '../CartUi/MyCartView.dart';

class FavProvidersScreen extends StatelessWidget {
  List<FavProvider>? favList;

  FavProvidersScreen({this.favList});

  @override
  Widget build(BuildContext context) {
    print("inside the fav screen : ${favList?.length}");
    var approvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return FavProviderWidget(favList![index]);
          },itemCount: favList?.length,))
        ],
      ),
    );
  }
}
class FavProviderWidget extends StatelessWidget {

  FavProvider favProvider;
  FavProviderWidget(this.favProvider);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(favProvider.providerFName??""),
        ],
      ),
    );
  }
}



