import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/CustomerParentWidget.dart';
import '../../../Common/Seperator.dart';
import 'CustomerCriteriaWidget.dart';

class ParentCategoryList extends StatelessWidget {

  List<dynamic>? Category;

  ParentCategoryList({ required this.Category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Seperator(),
          Row(
            children: [
              TextButton(onPressed: (){}, child:Text(
                "Our Services >",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontFamily: '2',
                ),
              ))
            ],
          ), // Add some spacing
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 , childAspectRatio: 2),
              itemBuilder: (context, index) =>
                  CustomerParentWidget(Category?[index]),
              itemCount: Category?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
