import 'package:device_information/device_information.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_marker/core/data_source/cache_data.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
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

  Future<bool> checkIfNull() async {
    if (await getIt<CacheData>().getString(key: 'studentId') == null ||
        await getIt<CacheData>().getString(key: 'studentId') == '' ||
        await getIt<CacheData>().getString(key: 'imeiNo') == null ||
        await getIt<CacheData>().getString(key: 'imeiNo') == '') {
      return false;
    } else {
      String? studentId = await getIt<CacheData>().getString(key: 'studentId');
      String? imeiNo = await getIt<CacheData>().getString(key: 'imeiNo');
      getIt<StudentInfo>().setValues(studentId: studentId!, studentIMEI: imeiNo!);
      return true;
    }
  }

  Widget mainWidget() {
    return FutureBuilder(
      future: checkIfNull(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return snapshot.data
              ? BlocProvider(
                  create: (context) => getIt<ConnectionCubit>(),
                  child: const ConnectionScreen(),
                )
              : WelcomeScreen();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
