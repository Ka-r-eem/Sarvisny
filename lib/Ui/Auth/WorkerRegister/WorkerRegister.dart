import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Ui/Auth/WorkerRegister/WorkerUploadFileScreen.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../Common/CustomFormField.dart';
import '../../../Provider/Provider.dart';
import '../../../data/API/apiManager.dart';
import '../../../data/Responses/WorkerRelatedDto/WorkerRegisterData.dart';
import '../Login.dart';


class WorkerRegister extends StatefulWidget {
  static const routeName = 'WorkerRegister';



  @override
  State<WorkerRegister> createState() => _RegisterState();
}

class _RegisterState extends State<WorkerRegister> {
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController NationalID = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ConfirmedPassword = TextEditingController();
  TextInputType email_type = TextInputType.emailAddress;
  TextInputType password_type = TextInputType.visiblePassword;
  TextInputType name_type = TextInputType.name;

  var keyform = GlobalKey<FormState>();
  File ?pdf_file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: keyform,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 8),
                    height:  MediaQuery.of(context).size.height * 0.4 ,
                    child: Image.asset(
                      'assets/images/LogoLight.png',
                      fit: BoxFit.contain,
                    )),
                CustomFormField(
                  firstname,
                  'Firstname',
                  name_type,
                  false,
                      (text) {
                    if (text == null || text == '') {
                      return 'Please Enter Your Username';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  lastname,
                  'lastname',
                  name_type,
                  false,
                      (text) {
                    if (text == null || text == '') {
                      return 'Please Enter Your Lastname';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
                  userName,
                  'Username',
                  name_type,
                  false,
                      (text) {
                    if (text == null || text =='') {
                      return 'Please Enter Your Username';
                    }
                  },
                  is_loginOr_Register: true,
                ),
                CustomFormField(
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
                // CustomFormField(
                //   criminalRecord,
                //   'Criminal Record',
                //   TextInputType.text,
                //   false,
                //       (text) {
                //     if (text == null || text == '') {
                //       return 'Please Enter Your Criminal Record';
                //     }
                //   },
                //   is_loginOr_Register: true,
                // ),
                CustomFormField(
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
                CustomFormField(
                  NationalID,
                  'National ID',
                  const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false
                  ),
                  false,
                      (text) {
                    if (text == null) {
                      return 'Please Enter Your Email';
                    }
                  },
                  is_loginOr_Register: true,
                ),

                CustomFormField(password, 'Password', password_type, true,
                        (text) {
                      if (text == null) return 'Please Enter Your Password';
                      if (password.text.length < 8) {
                        return 'Password Should be > 8 characters';
                      }
                    }, is_loginOr_Register: true),
                CustomFormField(
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
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff3a8bc8)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius to make it circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      oncreate(context);

                    },
                    child: const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                'Create Account',
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
                      const Text(
                        "Already Have Account ?",
                        style: TextStyle(
                            fontFamily: "2",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blue,
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
  void oncreate(context) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        print("entering first if");
        var responseData = await ApiManager.registerWorker(WorkerRegisterDataDto(
          userName: userName.text,
          email: email.text,
          password: password.text,
          firstName: firstname.text,
          lastName: lastname.text,
          phoneNumber: Phone.text,
          nationalID: NationalID.text,
        ),

        );
        print("after the assigning of response data");
        print("Entering the isError if ");
        print(responseData);
        if (responseData.isError == false) {
          Navigator.of(context).pop();
          print("Inside the isError if ");
          String yourToken = responseData.payload;
          Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
          provider.UserId = decodedToken['userId'];
          Navigator.pushNamed(context, Workeruploadfilescreen.routeName);
          // dialoguUtilities.showmsg(context, responseData.message ,postAction: () {
          //   Navigator.pop(context);
          // },);
        }
        else{
          print("Entering the Else ");
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(context, responseData.errors.toString(),pos:"Ok",
              postAction:(){
                Navigator.of(context).pop();
              });
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******$e");
      print(e);
    }
  }



}
