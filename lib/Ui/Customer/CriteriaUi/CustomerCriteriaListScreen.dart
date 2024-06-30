import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'CustomerCriteriaWidget.dart';

class CustomerCriteriaListScreen extends StatelessWidget {
  final List<CriteriaObject>? CriteriasList;

  CustomerCriteriaListScreen({Key? key, this.CriteriasList}) : super(key: key);

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Our Services",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontFamily: '2',
                ),
              ),
            ),
            SizedBox(height: 16), // Add some spacing
            CarouselSlider(
              options: CarouselOptions(height: 200 ,autoPlay: true,enlargeCenterPage: true,enlargeFactor: 0.5),
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
            SizedBox(height: 16), // Add some spacing
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    CustomerCriteriaWidget(CriteriasList?[index]),
                itemCount: CriteriasList?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
