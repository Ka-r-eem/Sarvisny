import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarvisny/dialoguUtilites.dart';

import '../../../Common/CustomFormField.dart';

class Workeruploadfilescreen extends StatefulWidget {
  static const String routeName = "WorkerUploadFileScreen";

  const Workeruploadfilescreen({super.key});

  @override
  State<Workeruploadfilescreen> createState() => _WorkeruploadfilescreenState();
}

class _WorkeruploadfilescreenState extends State<Workeruploadfilescreen> {
  TextEditingController criminalRecord = TextEditingController();
  TextEditingController imageController = TextEditingController();
  var keyform = GlobalKey<FormState>();
  File? pdfFile;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: keyform,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    'assets/images/LogoLight.png',
                    fit: BoxFit.contain,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.primary), borderRadius: BorderRadius.circular(10)),
                    child: pdfFile?.path != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    pdfFile!.path.substring(0, 20),
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                const Icon(
                                  Icons.picture_as_pdf_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                                  child: IconButton(
                                      alignment: Alignment.topRight,
                                      onPressed: () {
                                        pdfFile = null;
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                        child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 8, fontFamily: "2"),
                              border: InputBorder.none,
                              hintText: "Upload Your Criminal Record File ",
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "2",
                                  fontSize: 18),
                              suffixIcon: InkWell(
                                  onTap: () async {
                                    await pickPDF();
                                    setState(() {});
                                  },
                                  child: Icon(Icons.file_upload_outlined,
                                      size: 30, color: Theme.of(context).colorScheme.primary)),
                            )))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.primary), borderRadius: BorderRadius.circular(10)),
                    child: imageFile?.path != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    imageFile!.path.substring(0, 20),
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                                  child: IconButton(
                                      alignment: Alignment.topRight,
                                      onPressed: () {
                                        imageFile = null;
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                        child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(fontSize: 8, fontFamily: "2"),
                              border: InputBorder.none,
                              hintText: "Upload Your Image ",
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "2",
                                  fontSize: 18),
                              suffixIcon: InkWell(
                                  onTap: () async {
                                    await pickImage();
                                    setState(() {});
                                  },
                                  child: Icon(Icons.image_outlined,
                                      size: 30, color: Theme.of(context).colorScheme.primary)),
                            )))),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff3a8bc8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius to make it circular
                      ),
                    ),
                  ),
                  onPressed: () {
                    // oncreate(context);
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Create Account',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "2")),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
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
                          fontFamily: "2", color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
    );
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pdfFile = File(result.files.single.path!);
      setState(() {
        pdfFile;
      });

      print("Selected PDF: ${pdfFile?.path}");
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? cameraFile = await picker.pickImage(source: ImageSource.camera);
    final XFile? galleryFile = await picker.pickImage(source: ImageSource.gallery);

    if (cameraFile != null) {
      setState(() {
        imageFile = File(cameraFile.path);
      });
    } else if (galleryFile != null) {
      setState(() {
        imageFile = File(galleryFile.path);
      });
    }
  }

  // void oncreate(context) async {
  //   if (keyform.currentState?.validate() == false) {
  //     return;
  //   }
  //   print(keyform.currentState?.validate());
  //   try {
  //     dialoguUtilities.loadingDialog(context, "Please Wait...");
  //     if (keyform.currentState?.validate() == true) {
  //       print("entering first if");
  //       var responseData = await ApiManager.registerWorker(WorkerRegisterDataDto(
  //         userName: userName.text,
  //         email: email.text,
  //         password: password.text,
  //         firstName: firstname.text,
  //         lastName: lastname.text,
  //         phoneNumber: Phone.text,
  //         nationalID: NationalID.text,
  //       ),
  //
  //       );
  //       print("after the assigning of response data");
  //       print("Entering the isError if ");
  //       print(responseData);
  //       if (responseData.isError == false) {
  //         Navigator.of(context).pop();
  //         print("Inside the isError if ");
  //         Navigator.pushNamed(context, Workeruploadfilescreen.routeName);
  //         // dialoguUtilities.showmsg(context, responseData.message ,postAction: () {
  //         //   Navigator.pop(context);
  //         // },);
  //       }
  //       else{
  //         print("Entering the Else ");
  //         Navigator.of(context).pop();
  //         dialoguUtilities.showmsg(context, responseData.errors.toString(),pos:"Ok",
  //             postAction:(){
  //               Navigator.of(context).pop();
  //             });
  //       }
  //     }
  //   } catch (e) {
  //     Navigator.of(context).pop();
  //     print("Error*******$e");
  //     print(e);
  //   }
  // }

}
