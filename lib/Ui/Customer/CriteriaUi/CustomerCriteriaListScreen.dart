import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Ui/Admin/AdminDistrictsUi/DistrictsDropDown.dart';
import 'package:sarvisny/Ui/Admin/AdminServiceUi/ChildrenDropDown.dart';
import 'package:sarvisny/Ui/Admin/AdminServiceUi/ParentsDropDown.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/CategoryLists/CriteriaCategoryList.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/CategoryLists/WeekDayDropDown.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/MatchedWorkersScreen.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/SuggestedWorkersScreen.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/TimeDropDown.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetFirstMatchedUseCase.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetMatchedUseCase.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetSecondMatchedUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetAllMatchedResponse.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Common/CustomFormField.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../Provider/Provider.dart';
import '../../../di/di.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import '../../../domain/model/CustomerRelatedResponses/Get_First_Sec_Matched_Response.dart';
import '../../Admin/AdminServiceUi/CriteriaDropDown.dart';
import 'CustomerCriteriaWidget.dart';
import 'CategoryLists/ParentServicesCategoryList.dart';

class CustomerCriteriaListScreen extends StatefulWidget {
  final List<CriteriaObject>? CriteriasList;
  List<ParentService>? parentServices;

  CustomerCriteriaListScreen(
      {Key? key, this.CriteriasList, this.parentServices})
      : super(key: key);

  @override
  State<CustomerCriteriaListScreen> createState() =>
      _CustomerCriteriaListScreenState();
}

class _CustomerCriteriaListScreenState
    extends State<CustomerCriteriaListScreen> {
  var keyform = GlobalKey<FormState>();

  String? selectedParent;
  String? selectedChild;
  String? serviceId;
  String? startTime;
  String? dayOfWeek;
  String? districtID;

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
            CriteriaCategoryList(Category: widget.CriteriasList),
            ParentCategoryList(Category: widget.parentServices),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        closeManually: false,
        elevation: 20,
        curve: Curves.easeIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            label: 'Find Worker',
            onTap: () {
              _showFindWorkerBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFindWorkerBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        var colorProvider = Provider.of<ColorProvider>(context);
        String? subService;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SingleChildScrollView(
              child: Form(
                key: keyform,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("-Find Worker-",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: '2',
                              color: Theme.of(context).colorScheme.onPrimary),
                          textAlign: TextAlign.center),
                      ParentsDropDown(
                        onParentChanged: (p0) {
                          setModalState(() {
                            selectedParent = p0?.serviceId;
                          });
                        },
                      ),
                      ChildrenDropDown(
                          onChildChanged: (p0) {
                            selectedChild = p0?.childServiceID;
                          },
                          parentServiceID: selectedParent),
                      WeekdayDropDown(
                        onDayChanged: (p0) {
                          dayOfWeek = p0;
                        },
                      ),
                      DistrictsDropDown(
                        onDistrictChanged: (p0) {
                          districtID = p0?.districtID;
                        },
                      ),
                      TimeDropDown(onTimeChanged: (p0) {
                        startTime = p0;
                      },),


                      ElevatedButton(
                        onPressed: () {
                          FindWorker(
                              context,
                              selectedChild??"",
                              startTime??"",
                              dayOfWeek??"",
                              districtID??"");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                        ),
                        child: const Text("Find Worker",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: '2',
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void FindWorker(context, String serviceId, String time, String day, String district) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }

    print(keyform.currentState?.validate());

    try {
      var provider = Provider.of<AppProvider>(context, listen: false);
      print("enter try");

      GetMatchedUseCase getMatchedUseCase = getIt<GetMatchedUseCase>();
      GetFirstMatchedUseCase getFirstMatchedUseCase = getIt<GetFirstMatchedUseCase>();
      GetSecondMatchedUseCase getSecondMatchedUseCase = getIt<GetSecondMatchedUseCase>();

      dialoguUtilities.loadingDialog(context, "Please Wait...");

      if (keyform.currentState?.validate() == true) {
        print("enter the true");

        GetAllMatchedResponse responseData = await getMatchedUseCase.invoke(
            serviceId, day, time, district, provider.UserId ?? "");

        print("after response data");
        print(responseData.message);

        if (responseData.isError == false && responseData.payload != null && responseData.payload!.isNotEmpty) {
          print("inside first if");
          Navigator.of(context).pop();
          Navigator.pushNamed(context, MatchedWorkersScreen.routeName, arguments: responseData.payload);
        } else {
          // If payload is null or empty, try the next match methods
          print("inside second if");

          GetFirstSecMatchedResponse response = await getFirstMatchedUseCase.invoke(
              serviceId, day, time, district, provider.UserId ?? "");

          if (response.isError == false && response.payload != null && response.payload!.isNotEmpty) {
            print("inside third if");
            Navigator.of(context).pop();
            Navigator.pushNamed(context, SuggestedWorkersScreen.routeName, arguments: response.payload);
          } else {
            // If payload is still null or empty, try the last match method
            GetFirstSecMatchedResponse response = await getSecondMatchedUseCase.invoke(
                serviceId, day, time, district, provider.UserId ?? "");

            if (response.isError == false && response.payload != null && response.payload!.isNotEmpty) {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, SuggestedWorkersScreen.routeName, arguments: response.payload);
            }
          }
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error******* $e");
    }
  }
}
