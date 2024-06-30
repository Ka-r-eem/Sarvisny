import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  Icon? icon;
  TextInputType typeInput;
  bool is_hidden;
  Validator? validtor;
  bool is_visable = true;
  double? fieldHeight = 65 ;
  int lines;
  bool is_loginOr_Register;

  CustomFormField(this.controller, this.hintText, this.typeInput, this.is_hidden, this.validtor,
      {this.lines = 1, this.is_loginOr_Register = false , this.fieldHeight , this.icon});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<AppProvider>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Container(
            height: widget.fieldHeight,
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary), borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                child: TextFormField(

                  maxLines: widget.lines,
                  minLines: 1,
                  validator: widget.validtor,
                  obscureText: widget.is_hidden ? obj.is_visible : false,
                  keyboardType: widget.typeInput,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    icon: widget.icon,
                    errorStyle: const TextStyle(fontSize: 8, fontFamily: "2"),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily: "2",
                        fontSize: 18),
                    suffixIcon: widget.is_hidden
                        ? InkWell(
                            onTap: () {
                              if (obj.is_visible) {
                                obj.is_visible = false;
                                obj.changeVisability();
                              } else {
                                obj.is_visible = true;
                                obj.changeVisability();
                              }
                            },
                            child: obj.is_visible
                                ? Icon(
                                    Icons.visibility_off,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                          )
                        : null,
                  ),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontFamily: "2",
                      fontWeight: FontWeight.w400),
                ))));
  }
}
