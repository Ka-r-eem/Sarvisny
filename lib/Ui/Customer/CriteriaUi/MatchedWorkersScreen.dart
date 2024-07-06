import 'package:flutter/material.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';

class MatchedWorkersScreen extends StatelessWidget {

  static const String routeName = "MatchedWorkers";


  @override
  Widget build(BuildContext context) {

    var ProviderList = ModalRoute.of(context)?.settings.arguments as List<MatchedProvider>? ;
    return Scaffold(
      body: Column(
        children: [
          Text("Matched"),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return MatchedProviderWidget(ProviderList![index]);
              },itemCount: ProviderList?.length),
          ),
        ],
      ),
    );
  }
}

class MatchedProviderWidget extends StatelessWidget {

  MatchedProvider matchedProvider;

  MatchedProviderWidget(this.matchedProvider);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Text( matchedProvider.firstname ?? ""),
          ],
        ),
      ),
    );
  }
}

