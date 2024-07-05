import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Provider/ColorProvider.dart';
import 'CustomerRegister.dart';
import 'WorkerRegister/WorkerRegister.dart';

class ChooseUserType extends StatelessWidget {
  static const String routeName = "ChooseType";

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Sign Up",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 40,
                      fontFamily: "2")),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    colorProvider.isDarkEnabled() == true
                        ? 'assets/images/LogoDark.png'
                        : 'assets/images/LogoLight.png',
                    fit: BoxFit.contain,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, CustomerRegister.routeName);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary)),
                      child: const Text(
                        "Customer",
                        style: TextStyle(
                            fontSize: 22, fontFamily: "2", color: Colors.white),
                      )),
                ),
                const SizedBox(height: 12),
                SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, WorkerRegister.routeName);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary)),
                      child: const Text(
                        "Service Provider",
                        style: TextStyle(
                            fontSize: 22, fontFamily: "2", color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
