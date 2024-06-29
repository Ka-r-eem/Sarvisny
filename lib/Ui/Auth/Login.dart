import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../Common/CustomFormField.dart';
import '../../Common/EmailValidation.dart';
import '../../Provider/ColorProvider.dart';
import '../../Provider/Provider.dart';
import '../../data/API/apiManager.dart';
import '../../data/Responses/LoginUserData.dart';
import '../Admin/AdminHomeScreen.dart';
import '../Customer/CustomerHomeScreen.dart';
import '../Worker/WorkerHomeScreen.dart';
import 'ChooseUser.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _RegisterState();
}

class _RegisterState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController ConfirmedPassword = TextEditingController();
  TextInputType email_type = TextInputType.emailAddress;
  TextInputType password_type = TextInputType.visiblePassword;
  TextInputType name_type = TextInputType.name;

  var keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      body: Form(
        key: keyform,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    height: 250,
                    child: Image.asset(
                      'assets/images/LogoLight.png',
                      fit: BoxFit.contain,
                    )),
              ),
              CustomFormField(
                email,
                'Email',
                email_type,
                false,
                (text) {
                  if (text == null || text == '') {
                    return 'Please Enter Your Email';
                  }
                  if (validation().isValidEmail(text) == false) {
                    return 'Please Enter Valid Email';
                  }
                },
                is_loginOr_Register: true,
              ),
              CustomFormField(password, 'Password', password_type, true,
                  (text) {
                if (text == null || text == '')
                  return 'Please Enter Your Password';
                if (password.text.length < 8) {
                  return 'Password Should be > 8 characters';
                }
              }, is_loginOr_Register: true),
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius to make it circular
                      ),
                    ),
                  ),
                  onPressed: () {
                    login(context);
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "2",
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have An Account ?",
                      style: TextStyle(
                          fontFamily: "2",
                          color: colorProvider.isDarkEnabled() == true
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, ChooseUserType.routeName);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "2",
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Center(child: Text("Or")),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, CustomerHomeScreen.routeName);
                  },
                  child: Text('Enter As Guest     >>>',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline))),
            ],
          ),
        ),
      ),
    );
  }

  void login(context) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    try {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, 'Please Wait...');
      print("After the indicator ");
      if (keyform.currentState?.validate() == true) {
        print("State is true");
        var response = await ApiManager.Login(
            LoginUserData(email: email.text, password: password.text));
        print("response");
        print(response);
        if (response["isError"] == false &&
            response["payload"]["role"] == "Customer") {
          appProvider.token = response["payload"]["tokenString"];
          appProvider.UserId = response["payload"]["id"];
          Navigator.of(context).pop();
          print("skip customer");
          Navigator.pushReplacementNamed(context, CustomerHomeScreen.routeName);
        } else if (response["isError"] == false &&
            response["payload"]["role"] == "ServiceProvider") {
          appProvider.token = response["payload"]["tokenString"];
          appProvider.UserId = response["payload"]["id"];
          Navigator.of(context).pop();
          print("skip Worker");
          Navigator.pushReplacementNamed(context, WorkerHomeScreen.routeName);
        } else if (response["isError"] == false &&
            response["payload"]["role"] == "Admin") {
          appProvider.token = response["payload"]["tokenString"];
          appProvider.UserId = response["payload"]["id"];
          print("In Admin");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, AdminHomeScreen.routeName);
        } else if (response["isError"] == true) {
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(context, response["errors"].toString(),
              pos: "Ok", postAction: () {
            Navigator.of(context).pop();
          });
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******");
      print(e);
    }
  }
}
