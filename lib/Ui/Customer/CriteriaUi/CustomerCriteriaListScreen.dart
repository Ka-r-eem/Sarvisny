import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/CategoryLists/CriteriaCategoryList.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import 'CustomerCriteriaWidget.dart';
import 'CategoryLists/ParentServicesCategoryList.dart';

class CustomerCriteriaListScreen extends StatelessWidget {
  final List<CriteriaObject>? CriteriasList;
  List<ParentService>? parentServices;

  CustomerCriteriaListScreen(
      {Key? key, this.CriteriasList, this.parentServices})
      : super(key: key);

  final List<String> imgList = [
    'assets/images/ac-repair.jpeg',
    'assets/images/Car Maintenance.jpg',
    'assets/images/carpenter.jpg',
    'assets/images/Cleaning.jpg',
    'assets/images/learning.jpg',
    'assets/images/Plumbing.jpg',
    'assets/images/soon.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Shimmer.fromColors(
                baseColor:
                    colorProvider.isDarkEnabled() ? Colors.black : Colors.white,
                highlightColor: Colors.blue,
                period: Duration(seconds: 15),
                child: Text(
                  "Here To Serve",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25,
                    fontFamily: '2',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Add some spacing
            CarouselSlider(
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5),
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.amber,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16), // Add some spacing
            CriteriaCategoryList(Category:CriteriasList),
            ParentCategoryList(Category: parentServices),
          ],
        ),
      ),
    );
  }
}
