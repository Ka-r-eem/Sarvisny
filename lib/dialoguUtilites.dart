import 'package:flutter/material.dart';

class dialoguUtilities {


  static void hideDialog(BuildContext context, String msg,{VoidCallback?postAction})
  {
    showDialog(context:context, builder: (buildcontext){

      return AlertDialog(
        content:
        SingleChildScrollView(child: Text(msg,style:TextStyle(color: Colors.black),)),
        actions: [
          TextButton(
            child:  const Text('OK',style: TextStyle(color: Colors.black),),
            onPressed: () {
              postAction?.call();
            },
          ),
        ],
      );

    }

    );
  }

  static void loadingDialog(BuildContext context,String msg){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return  AlertDialog(
            content: SingleChildScrollView(
                child: Row(
                  children: [
                    CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(width: 8),
                    Text(msg,style:TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  ],
                )),
          );
        }
    );
  }
  static void showmsg(BuildContext context, String msg, {String pos = 'ok', VoidCallback? postAction, String? txt}) {
    showDialog(
      context: context,
      builder: (BuildContext buildcontext) {
        return AlertDialog(
          content: SingleChildScrollView(child: Text(msg,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary ,fontSize: 22),)),
          actions: [
            TextButton(
              child: Text(pos,style:TextStyle(color: Colors.white),),
              onPressed: () {
                postAction?.call();
              },
            ),
            if (txt != null)
              TextButton(
                child: Text(txt,style:TextStyle(color:Colors.white),),
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
