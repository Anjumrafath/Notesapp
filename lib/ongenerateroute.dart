import 'package:flutter/material.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/features/domain/entities/note/noteentity.dart';
import 'package:notesapp/features/presentation/pages/addnewnotepage.dart';
import 'package:notesapp/features/presentation/pages/signinpage.dart';
import 'package:notesapp/features/presentation/pages/signuppage.dart';
import 'package:notesapp/features/presentation/pages/updatenotepage.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.signInPage:
        {
          return materialBuilder(widget: SignInPage());
          break;
        }
      case PageConst.signUpPage:
        {
          return materialBuilder(widget: SignUpPage());
          break;
        }
      case PageConst.addNotePage:
        {
          if (args is String) {
            return materialBuilder(
                widget: AddNewNotePage(
              uid: args,
            ));
          } else {
            return materialBuilder(
              widget: ErrorPage(),
            );
          }
          break;
        }
      case PageConst.UpdateNotePage:
        {
          if (args is NoteEntity) {
            return materialBuilder(
                widget: UpdateNotePage(
              noteEntity: args,
            ));
          } else {
            return materialBuilder(
              widget: ErrorPage(),
            );
          }
          break;
        }
      default:
        return materialBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
