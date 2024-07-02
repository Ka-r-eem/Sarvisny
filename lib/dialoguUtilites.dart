import 'package:flutter/material.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';

class dialoguUtilities {
  static void hideDialog(BuildContext context, String msg,
      {VoidCallback? postAction}) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Text(
              msg,
              style: TextStyle(color: Colors.black),
            )),
            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  postAction?.call();
                },
              ),
            ],
          );
        });
  }

  static void loadingDialog(BuildContext context, String msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Column(
              children: [
                Expanded(child: LogoLoader()),
                const SizedBox(width: 8),
                Text(
                  msg,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          );
        });
  }

  static void showmsg(BuildContext context, String msg,
      {String pos = 'ok', VoidCallback? postAction, String? txt}) {
    showDialog(
      context: context,
      builder: (BuildContext buildcontext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(side:  BorderSide(color: Colors.white,width: 2),borderRadius: BorderRadius.circular(32)),
          content: Text(
                      msg,
                      style: TextStyle(
            color: Theme.of(context).colorScheme.primary, fontSize: 22),
                    ),
          actions: [
            TextButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.white ,width: 2)))
              ,child: Text(
                pos,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                postAction?.call();
              },
            ),
            if (txt != null)
              TextButton(style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  side: WidgetStatePropertyAll(BorderSide(color: Colors.white ,width: 2))),

                child: Text(
                  txt,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          ],
        );
      },
    );
  }
}
