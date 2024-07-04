import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Ui/Admin/AdminDistrictsUi/DistrictsDropDown.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import '../../Common/CustomFormField.dart';
import '../../Provider/ColorProvider.dart';
import '../../data/API/apiManager.dart';
import '../../data/Responses/CustomerRelatedDto/CustomerRegisterData.dart';
import '../../di/di.dart';
import '../../domain/UseCases/CustomerUseCases/CustomerRegisterUseCase.dart';
import 'Login.dart';

class CustomerRegister extends StatefulWidget {
  static const routeName = 'CustomerRegister';


  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ConfirmedPassword = TextEditingController();
  TextInputType email_type = TextInputType.emailAddress;
  TextInputType password_type = TextInputType.visiblePassword;
  TextInputType name_type = TextInputType.name;
  DistrictData? selectedDistrict;

  var keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);
    firstname.text = "Kareem";
    lastname.text = "amin";
    userName.text = "Kareemamin";
    Phone.text = "0123654";
    email.text = "kimo@gmail.com";
    Address.text = "Kareemmaadi";
    password.text = "Kareem123&";
    ConfirmedPassword.text = "Kareem123&";
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: keyform,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset(
                      colorProvider.isDarkEnabled() == true ?
                          "assets/images/LogoDark.png":
                      'assets/images/LogoLight.png',
                      fit: BoxFit.contain,
                    )),
                CustomFormField(
                  icon:  Icon(Icons.person),
                  firstname,
                  'First Name',
                  name_type,
                  false,
                  (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Your Firstname';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  icon:  Icon(Icons.person),
                  lastname,
                  'Last Name',
                  name_type,
                  false,
                  (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Your Lastname';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  icon:  Icon(Icons.person),
                  userName,
                  'Username',
                  name_type,
                  false,
                  (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Your Username';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  icon: Icon(Icons.phone_android),
                  Phone,
                  'Phone Number',
                  TextInputType.phone,
                  false,
                  (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Your Phone NUmber';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  icon: Icon(Icons.location_on),
                  Address,
                  'Address',
                  TextInputType.streetAddress,
                  false,
                  (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Your Address';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  icon: Icon(Icons.email),
                  email,
                  'Email',
                  email_type,
                  false,
                  (text) {
                    if (text == null) {
                      return 'Please Enter Your Email';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                DistrictsDropDown(onDistrictChanged: (p0) {
                  selectedDistrict = p0;
                },),
                CustomFormField(
                    icon:  Icon(Icons.lock),
                    password, 'Password', password_type, true,
                    (text) {
                  if (text == null) return 'Please Enter Your Password';
                  if (password.text.length < 8) {
                    return 'Password Should be > 8 characters';
                  }
                }, is_loginOr_Register: true),
                CustomFormField(
                    icon:  Icon(Icons.lock),
                    ConfirmedPassword, 'Confirm Password', password_type, true,
                    (text) {
                  if (text == null || text.length < 8) {
                    return 'Please Confirm Your Password';
                  }
                  if (password.text != text) {
                    return "Password Doesn't Match";
                  }
                  return null;
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius to make it circular
                        ),
                      ),
                    ),
                    onPressed: () {

                      oncreate();
                    },
                    child: const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Create Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "2")),
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
                        "Already Have Account ?",
                        style: TextStyle(
                            fontFamily: "2",
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "2",
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void oncreate() async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      CustomerRegisterUseCase registerUseCase = getIt<CustomerRegisterUseCase>();

      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        var responseData = await registerUseCase.invoke(CustomerRegisterDataDto(
          userName: userName.text,
          email: email.text,
          password: password.text,
          firstName: firstname.text,
          lastName: lastname.text,
          phoneNumber: Phone.text,
          address: Address.text,
          districtName: selectedDistrict?.districtName,
        ),
            );
        if (responseData["isError"] == false) {
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
        else{
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(context, responseData["errors"].toString(),pos:"Ok",
              postAction:(){
            Navigator.of(context).pop();
          });
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******$e");
    }
  }
}
