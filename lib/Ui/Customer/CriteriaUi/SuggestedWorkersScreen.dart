import 'package:flutter/material.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';

class SuggestedWorkersScreen extends StatelessWidget {

  static const String routeName = "SuggestedWorkers";


  @override
  Widget build(BuildContext context) {

    var ProviderList = ModalRoute.of(context)?.settings.arguments as List<SuggestedProviders>? ;
    return Scaffold(
      body: Column(
        children: [
          Text("Suggested"),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return SuggestedProviderWidget(ProviderList![index]);
              },itemCount: ProviderList?.length),
          ),
        ],
      ),
    );
  }
}

class SuggestedProviderWidget extends StatelessWidget {

  SuggestedProviders provider;

  SuggestedProviderWidget(this.provider);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Text( provider.firstname ?? ""),
          ],
        ),
      ),
    );
  }
}

