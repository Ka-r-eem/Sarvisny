import 'package:flutter/material.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';

class MatchedWorkersScreen extends StatelessWidget {

  static const String routeName = "MatchedWorkers";


  @override
  Widget build(BuildContext context) {

    var ProviderList = ModalRoute.of(context)?.settings.arguments as List<MatchedProvider>? ;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Matched",style:TextStyle(fontSize: 25,fontFamily: "2",color: Theme.of(context).colorScheme.primary)),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return MatchedProviderWidget(ProviderList![index]);
                },itemCount: ProviderList?.length),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchedProviderWidget extends StatelessWidget {

  MatchedProvider matchedProvider;

  MatchedProviderWidget(this.matchedProvider);

  @override
  Widget build(BuildContext context) {
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
                Text("${matchedProvider.firstname} ${matchedProvider.lastname}",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "2",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary)),
                IconButton(
                  icon: Icon(Icons.navigate_next_rounded , size: 40, color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    {
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
}

