import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_marker/core/data_source/cache_data.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/pages/connection_screen.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({
    Key? key,
    required this.formKey,
    required this.studentId,
  }) : super(key: key);

  final TextEditingController studentId;
  final GlobalKey<FormState> formKey;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.12,
      ),
      child: waiting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.09,
              child: RawMaterialButton(
                onPressed: () {
                  saveButtonPressed(context);
                },
                fillColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: loginButtonBorderStyle),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      color: Color(0xff1AA7EC), fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }

  BorderRadius get loginButtonBorderStyle => const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        topLeft: Radius.circular(80),
      );

  void saveButtonPressed(BuildContext context) async {
    var status = await Permission.phone.status;
    if (status.isDenied) {
      await Permission.phone.request();
    }else{
      if (widget.formKey.currentState!.validate()) {
        setState(() {
          waiting = true;
        });
        await  getIt<CacheData>()
            .setString(key: 'studentId', value: widget.studentId.text)
            .then((value) async{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => getIt<ConnectionCubit>(),
                child: const ConnectionScreen(),
              ),
            ),

          );
        });
        try {
          String imeiNo = await DeviceInformation.deviceIMEINumber;
          getIt<CacheData>()
              .setString(key: 'imeiNo', value:imeiNo);
          getIt<StudentInfo>()
              .setValues(studentId: widget.studentId.text, studentIMEI: imeiNo);

        } catch (_) {
        }
      }
    }

  }
}
