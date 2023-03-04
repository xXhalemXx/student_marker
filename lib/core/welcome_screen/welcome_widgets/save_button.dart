import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';
import 'package:student_marker/features/local_connection/presentation/pages/connection_screen.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key,
    required this.formKey,
    required this.studentId,
    required this.prefs
  });

  final TextEditingController studentId;
  final GlobalKey<FormState> formKey;

  final SharedPreferences prefs;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool waiting=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery
            .of(context)
            .size
            .height * 0.12,
      ),
      child:waiting?const Center(child: CircularProgressIndicator(),): SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.09,
        child: RawMaterialButton(
          onPressed: () {
            saveButtonPressed(context);
          },
          fillColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: loginButtonBorderStyle),
          child: const Text('Continue', style: TextStyle(
              color: Color(0xff1AA7EC), fontWeight: FontWeight.bold),),

        ),
      ),
    );
  }

  BorderRadius get loginButtonBorderStyle =>
      const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        topLeft: Radius.circular(80),
      );

  void saveButtonPressed(BuildContext context) {

    if (widget.formKey.currentState!.validate()) {
      setState(() {
        waiting=true;
      });
      widget.prefs.setString('studentId', widget.studentId.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ConnectionCubit>(),
                child:  ConnectionScreen(prefs: widget.prefs,),
              ),
        ),
      );
    }
  }
}