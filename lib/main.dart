import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/features/presentation/cubit/auth/authcubit.dart';

import 'package:notesapp/features/presentation/cubit/note/notecubit.dart';
import 'package:notesapp/features/presentation/cubit/user/usercubit.dart';
import 'package:notesapp/features/presentation/pages/homepage.dart';
import 'package:notesapp/features/presentation/pages/signinpage.dart';
import 'package:notesapp/ongenerateroute.dart';
import 'package:notesapp/injectioncontainer.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:notesapp/features/presentation/cubit/auth/authstate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),
        BlocProvider<NoteCubit>(create: (_) => di.sl<NoteCubit>()),
      ],
      child: MaterialApp(
        title: 'My Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
              if (authState is Authenticated) {
                return HomePage(
                  uid: authState.uid,
                );
              }
              if (authState is UnAuthenticated) {
                return SignInPage();
              }

              return CircularProgressIndicator();
            });
          }
        },
      ),
    );
  }
}
