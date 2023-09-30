import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/scan_widgets/connection_dialogs_result.dart';

class ActiveCoursesTail extends StatefulWidget {
  const ActiveCoursesTail(
      {Key? key, required this.courseValue})
      : super(key: key);

  final Map<String, String> courseValue;

  @override
  State<ActiveCoursesTail> createState() => _ActiveCoursesTailState();
}

class _ActiveCoursesTailState extends State<ActiveCoursesTail> {
  String userName = '';
  String courseName = '';
  String courseId = '';
  int connectionCode = 0;
  int statusCode = 10;
  bool taped = false;

  //values from payload
  //status codes 0-> student attended
  //status codes 1-> student not rolled in this class
  //status codes 2-> student already attended
  //status codes 3-> student used this device to attend

  //connection code
  //0 => idl
  //100 => trying to connect
  //200 => connection done waiting for result
  //300 => error
  //400 => success
  @override
  void initState() {
    userName =getIt<StudentInfo>().studentIMEI;
    userName +=getIt<StudentInfo>().studentId;
    widget.courseValue.forEach((key, value) {
      courseName = value;
      courseId = key;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          tapCourse(courseId);
        },
        child: ListTile(
          tileColor: Colors.white54,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: AutoSizeText(
            removeUnderscore(courseName),
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: subtitleValue(),
          trailing: trailingValue(),
        ),
      ),
    );
  }

  String removeUnderscore(String value) {
    List tempCourses = value.split('');
    String tempString = '';
    for (var x in tempCourses) {
      if (x != '_') {
        tempString += x;
      } else {
        tempString += ' ';
      }
    }
    return tempString;
  }

  tapCourse(String id) {
    if (!taped) {
      firstTapFun(id);
    } else {
      secondTapFun();
    }
  }

  firstTapFun(String id) async {
    setState(() {
      connectionCode = 100;
    });
    await Nearby().requestConnection(
      userName,
      id,
      onConnectionInitiated: (id, info) async {
        await Nearby().acceptConnection(
          id,
          onPayLoadRecieved: (endpointId, payload) async {
            String str = String.fromCharCodes(payload.bytes!);
            await sendRespondBack(str, id);
          },
        );
        await Nearby().stopDiscovery();
      },
      onConnectionResult: (id, status) async {
        if (status == Status.CONNECTED) {
          setState(() {
            connectionCode = 200;
          });
          await Future.delayed(const Duration(milliseconds: 400));
          await Nearby()
              .sendBytesPayload(id, Uint8List.fromList('5'.codeUnits));
        } else if (status == Status.ERROR) {
          setState(() {
            connectionCode = 300;
          });
        }
      },
      onDisconnected: (id) async {
        setState(() {
          connectionCode = 400;
        });
      },
    );
    taped = true;
  }

  secondTapFun() {
    if (statusCode == 0) {
      attendedDialog(context);
    } else if (statusCode == 1) {
      notRolledInDialog(context);
    } else if (statusCode == 2) {
      alreadyAttendedDialog(context);
    } else if (statusCode == 3) {
      usingSameDeviceDialog(context);
    } else {
      unknownResult(context);
    }
  }

  Widget subtitleValue() {
    if (connectionCode == 100) {
      return const Text(
        AllTexts.tryToConnect,
      );
    } else if (connectionCode == 200) {
      return const AutoSizeText(
        AllTexts.connected,
        maxLines: 1,
        style: TextStyle(color: AllColors.successColor),
      );
    } else if (connectionCode == 300) {
      return const Text(AllTexts.errorInConnection,
          style: TextStyle(color: AllColors.failConnectionColor));
    } else if (connectionCode == 400) {
      return const Text(AllTexts.disconnected,
          style: TextStyle(color: AllColors.disconnectedColor));
    } else {
      return const Text(
        AllTexts.tapToConnect,
      );
    }
  }

  Widget trailingValue() {
    if (connectionCode == 100) {
      return const SizedBox(
          width: 20, height: 20, child: CircularProgressIndicator());
    } else if (connectionCode == 200) {
      return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: AllColors.successColor,
          ));
    } else if (connectionCode == 300) {
      return const Icon(
        Icons.dangerous,
        color: AllColors.failConnectionColor,
      );
    } else if (connectionCode == 400) {
      return const Icon(
        Icons.done,
        color: AllColors.disconnectedColor,
      );
    } else {
      return const Icon(
        Icons.book_outlined,
        color: Color(0xff3b3b3b),
      );
    }
  }

  sendRespondBack(String str, String id) async {
    if (int.parse(str) == 0) {
      statusCode = 0;
      await Nearby().sendBytesPayload(
          id, Uint8List.fromList(statusCode.toString().codeUnits));
    } else if (int.parse(str) == 1) {
      statusCode = 1;
      await Nearby().sendBytesPayload(
          id, Uint8List.fromList(statusCode.toString().codeUnits));
    } else if (int.parse(str) == 2) {
      statusCode = 2;
      await Nearby().sendBytesPayload(
          id, Uint8List.fromList(statusCode.toString().codeUnits));
    } else if (int.parse(str) == 3) {
      statusCode = 3;
      await Nearby().sendBytesPayload(
          id, Uint8List.fromList(statusCode.toString().codeUnits));
    }
  }
}
