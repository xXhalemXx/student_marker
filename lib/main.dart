import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/core/welcome_screen/welcome_screen.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/pages/connection_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  initGetIt();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(DevicePreview(
    builder: (BuildContext context) => MyApp(),
    enabled: false,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Marker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<ConnectionCubit>(),
        child: mainWidget(),
      ),
    );
  }

  checkIfNull() {
    if (prefs.getString('studentId') == null ||
        prefs.getString('studentId') == '') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> assignFile() async {
    prefs = await _prefs;
    await Future.delayed(const Duration(seconds: 1, milliseconds: 50));
    return true;
  }

  Widget mainWidget() {
    return FutureBuilder(
      future: assignFile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return checkIfNull()
              ? WelcomeScreen(
                  prefs: prefs,
                )
              : BlocProvider(
                  create: (context) => getIt<ConnectionCubit>(),
                  child: ConnectionScreen(
                    prefs: prefs,
                  ),
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
