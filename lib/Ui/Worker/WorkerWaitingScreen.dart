import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/ColorProvider.dart';
import 'package:sarvisny/Ui/Auth/Login.dart';

class WorkerWaitingScreen extends StatelessWidget {

  static const String routeName = "WorkerWaiting";

  @override
  Widget build(BuildContext context) {

    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    },
        icon : Icon(Icons.arrow_back))
        ],
        title: Image.asset(
            colorProvider.isDarkEnabled()
                ? "assets/images/LogoNoContainerDark.png"
                : "assets/images/LogoNoContainerLight.png",
            height: 30),
          shape: UnderlineInputBorder(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 5)),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network("https://lottie.host/185bf459-be7a-4f00-8c4e-43e1f00de64f/lIxFEj8jB4.json"),
          Text("Your Request Is Sent To Our HR" ,style: TextStyle(fontSize: 25 ,color: Theme.of(context).colorScheme.primary)),
          Text("We Will Respond To You Soon" ,style: TextStyle(fontSize: 25 ,color: Theme.of(context).colorScheme.primary)),

        ],
      ),
    );
  }
}
