import 'package:flutter/material.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'CustomerCriteriaWidget.dart';

class CustomerCriteriaListScreen extends StatelessWidget {


  List<CriteriaObject>? CriteriasList;

  CustomerCriteriaListScreen({Key? key, this.CriteriasList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("Criteria",style: TextStyle(color: Theme.of(context).colorScheme.primary ,fontSize: 25,fontFamily: '2'),)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    CustomerCriteriaWidget(CriteriasList?[index]),
                itemCount: CriteriasList?.length,
                ),
            ),
          ],
        ),
      ),

    );
  }
}
