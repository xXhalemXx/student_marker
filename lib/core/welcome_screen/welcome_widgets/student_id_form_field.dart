import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({Key? key,  required this.studentId}) : super(key: key);

  final TextEditingController studentId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.08,
          right: MediaQuery.of(context).size.width * 0.08),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: textField('Enter your ID'),
        ),
      ),
    );
  }

  Widget textField(String text) => TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: studentId,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.left,
        cursorColor: Colors.white,
        maxLines: 1,
        validator: (value) {
          return studentIdValidate(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white60),
        ),
      );

  String? studentIdValidate(String? value) {
    final validCharacters = RegExp(r"^\d+$");
    if (value == null || value.isEmpty || value == '') {
      return 'You need to fill this field 😒';
    }  else if (!validCharacters.hasMatch(value)) {
      return 'you can use integers only';
    }
    return null;
  }
}
