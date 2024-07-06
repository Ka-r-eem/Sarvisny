import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../Common/snackBar.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../Provider/Provider.dart';
import '../../../di/di.dart';
import '../../../domain/UseCases/CustomerUseCases/RemoveProviderFromFavUseCase.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';
import '../../../domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import '../CartUi/MyCartView.dart';
import '../WorkerUI/FilteredWorkers/ServiceWorkersWidget.dart';
import '../WorkerUI/WorkerDetailsScreen.dart';

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
          favList?.length == 0 ? Text("No Favourite Providers") : Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return FavProviderWidget(favList![index]);
          },itemCount: favList?.length,))
        ],
      ),
    );
  }
}
class FavProviderWidget extends StatefulWidget {

  FavProvider favProvider;
  FavProviderWidget(this.favProvider);

  @override
  State<FavProviderWidget> createState() => _FavProviderWidgetState();
}

class _FavProviderWidgetState extends State<FavProviderWidget> {

  bool isFav = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2),
            color: Colors.white),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.favProvider.providerFName} ${widget.favProvider.providerLName}",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "2",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary)),
                IconButton(
                  icon: isFav ? Icon(Icons.star , size: 28, color: Colors.red) :Icon(Icons.star_border , size: 28, color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    {
                      RemoveProviderFromFav(context , widget.favProvider.providerId??"",provider.UserId??"" );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void RemoveProviderFromFav(context , String workerID, String customerId) async {
    RemoveProviderFromFavUseCase removeProviderFromFavUseCase = getIt<RemoveProviderFromFavUseCase>();
    var response = await removeProviderFromFavUseCase.invoke(workerID, customerId);
    if(response.isError == false){
      snackBar.showSnackBar(context, "Provider Removed Successfully", Colors.green);
      setState(() {
        isFav = false;
      });
    }
    else{
      snackBar.showSnackBar(context, response.message.toString(), Colors.red);
    }
  }
}



