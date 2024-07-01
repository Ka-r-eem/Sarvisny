import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Customer/ServiceUi/ChildrenServices/ChildServiceWidget.dart';
import '../../../../domain/model/AdminRelatedResponses/childrenServicesResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../CustomerServiceWidget.dart';

class ChildrenServicesListScreen extends StatefulWidget {


  List<Children>? children ;

  ChildrenServicesListScreen({Key? key, this.children}) : super(key: key);

  @override
  State<ChildrenServicesListScreen> createState() => _ChildrenServicesListScreenState();
}

class _ChildrenServicesListScreenState extends State<ChildrenServicesListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("SubServices",style: TextStyle(fontFamily: '2',fontSize: 25,color: Theme.of(context).colorScheme.primary),),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    ChildServiceWidget(widget.children?[index]),
                itemCount: widget.children?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),

    );
  }

}
