import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/permisson_granted_widgets/permission_granted_button.dart';

class ActiveCoursesTail extends StatefulWidget {
  const ActiveCoursesTail(
      {Key? key, required this.courseValue, required this.prefs})
      : super(key: key);
  final SharedPreferences prefs;

  final Map<String, String> courseValue;

  @override
  State<ActiveCoursesTail> createState() => _ActiveCoursesTailState();
}

class _ActiveCoursesTailState extends State<ActiveCoursesTail> {
  String userName = '';
  String courseName = '';
  String courseId = '';
  int connectionCode = 0;

  //connection code
  //0 => idl
  //1 => trying to connect
  //2 => rejected
  //3 => error
  //4 => success
  @override
  void initState() {
    userName = widget.prefs.getString('studentId')!;
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

  tapCourse(String id) {
    if (connectionCode == 0 || connectionCode == 3) {
      setState(() {
        connectionCode = 1;
      });

      Nearby().requestConnection(
        userName,
        id,
        onConnectionInitiated: (id, info) {
          onConnectionInit(id, info);
          Nearby().stopDiscovery();
        },
        onConnectionResult: (id, status) {

          if (status == Status.CONNECTED) {
            setState(() {
              connectionCode = 4;
            });
          } else if (status == Status.REJECTED) {
            setState(() {
              connectionCode = 2;
            });
          } else if (status == Status.ERROR) {
            setState(() {
              connectionCode = 3;
            });
          }
        },
        onDisconnected: (id) {
          PermissionGrantedButton.availableCourses.remove(widget.courseValue);
          setState(() {
            connectionCode = 4;
          });
        },
      );
    }else if(connectionCode==2) {
      rejectedDialog();

    } else {
      debugPrint('do nothing');
    }
  }

  rejectedDialog(){
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: const Text(AllTexts.error,style: TextStyle(color: AllColors.failConnectionColor),),
        content: const Text(AllTexts.connectionRejected),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        actions: [TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text(AllTexts.ok))],
      );
    });
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

  void onConnectionInit(String id, ConnectionInfo info) {
    Nearby().acceptConnection(
      id,
      onPayLoadRecieved: (_, payload) {},
    );
  }

  Widget subtitleValue() {
    if (connectionCode == 1) {
      return const Text(
        AllTexts.tryToConnect,
      );
    } else if (connectionCode == 2) {
      return const AutoSizeText(
        AllTexts.rejectedConnection,
        maxLines: 1,
        style: TextStyle(color: AllColors.failConnectionColor),
      );
    } else if (connectionCode == 3) {
      return const Text(AllTexts.errorInConnection,
          style: TextStyle(color: AllColors.failConnectionColor));
    } else if (connectionCode == 4) {
      return const Text(AllTexts.assigned,
          style: TextStyle(color: AllColors.successColor));
    } else {
      return const Text(
        AllTexts.tapToConnect,
      );
    }
  }

  Widget trailingValue() {
    if (connectionCode == 1) {
      return const SizedBox(
          width: 20, height: 20, child: CircularProgressIndicator());
    } else if (connectionCode == 2) {
      return const Icon(
        Icons.wifi_off_rounded,
        color: AllColors.failConnectionColor,
      );
    } else if (connectionCode == 3) {
      return const Icon(
        Icons.dangerous,
        color: AllColors.failConnectionColor,
      );
    } else if (connectionCode == 4) {
      return const Icon(
        Icons.done,
        color: AllColors.successColor,
      );
    } else {
      return const Icon(
        Icons.book_outlined,
        color: Color(0xff3b3b3b),
      );
    }
  }
}
