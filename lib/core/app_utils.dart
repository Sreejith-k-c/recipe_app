import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtils {
  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    Color?txtColor,
    TextStyle? textStyle,
    required BuildContext context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context)
        // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Colors.white,
        content: Text(message!, style: textStyle ?? GoogleFonts.kanit(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color:txtColor?? Colors.black
  )),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }
  
}