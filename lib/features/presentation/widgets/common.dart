import 'package:flutter/material.dart';

void snackBarError({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  SnackBar(
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("$msg"), Icon(Icons.auto_awesome)],
    ),
  );
}
