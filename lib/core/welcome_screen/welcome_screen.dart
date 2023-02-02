import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/custom_paint.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/hello_text.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/name_form_field.dart';
import 'package:student_marker/core/welcome_screen/welcome_widgets/save_button.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key,required this.prefs});

  final TextEditingController doctorName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1AA7EC),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            gestureDetectorTap(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomPaintForLogin(),
              const HelloText(),
              NameFormField(
                doctorName: doctorName,
              ),
              SaveButton(
                doctorName: doctorName,
                formKey: formKey,
                prefs: prefs,
              ),
            ],
          ),
        ),
      ),
    );
  }
  gestureDetectorTap(BuildContext context) {
    FocusScopeNode currentFoucs=FocusScope.of(context);
    if(!currentFoucs.hasPrimaryFocus)
    {
      currentFoucs.unfocus();
    }
  }
}
