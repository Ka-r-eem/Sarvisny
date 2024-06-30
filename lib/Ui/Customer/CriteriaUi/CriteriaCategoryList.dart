import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../Common/Seperator.dart';
import 'CustomerCriteriaWidget.dart';

class CriteriaCategoryList extends StatelessWidget {

  List<dynamic>? Category;

  CriteriaCategoryList({ required this.Category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Seperator(),
          Row(
            children: [
              TextButton(onPressed: (){}, child:Text(
                "Our Categories >",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontFamily: '2',
                ),
              ))
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 100,

                autoPlay: true,
                enlargeFactor: 0.5),
            items: Category?.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: CustomerCriteriaWidget(item),
                  );
                },
              );
            }).toList(),
          ),// Add some spacing
        ],
      ),
    );
  }
}
