import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_state.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/no_permission_widgets/no_permission_main_widget.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/permission_granted_main-widget.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/scan_widgets/scan_main_widget.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/stop_connection_button/stop_connection_button.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/waiting_widget/waiting_widget.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  void initState() {
    getIt<ConnectionCubit>().checkPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return backButtonPressed();
      },
      child: Container(
        decoration: backGroundColor(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: BlocBuilder<ConnectionCubit, ConnectionStates>(
              builder: (_, currentState) {
                return currentState.when(initState: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, noPermissionsGranted: () {
                  return const NoPermissionMainWidget();
                }, permissionsGranted: () {
                  return const PermissionsGrantedMainWidget();
                }, activeScan: (availableCourses) {
                  return ScanMainWidget(
                    availableCourses: availableCourses,
                  );
                }, wanting: () {
                  return const WaitingWidget();
                });
              },
            ),
          ),
          floatingActionButton: BlocBuilder<ConnectionCubit, ConnectionStates>(
            builder: (_, currentState) {
              if (currentState is ActiveScan) {
                return const StopConnectionButton();
              } else {
                return const SizedBox();
              }
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  BoxDecoration backGroundColor() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff6DB3FE),
          Colors.lightBlueAccent,
          Colors.lightBlueAccent,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }

 Future<bool> backButtonPressed() async {
    if (getIt<ConnectionCubit>().state is ActiveScan ||
        getIt<ConnectionCubit>().state is Wanting) {
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text(
                AllTexts.warning,
                style: TextStyle(color: AllColors.failConnectionColor),
              ),
              content: const Text(AllTexts.backButton),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              actions: [TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text(AllTexts.ok))],
            );
          });
      return false;
    }
    else{
      return true;
    }
  }
}
