import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({super.key, required this.studentId});

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
          child: textField('Enter your national ID'),
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
          return nameValidate(value);
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

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return 'You need to fill this field 😒';
    } else if (value.length != 14) {
      return 'your national Id must be 14 number';
    } else if (value.contains('.') ||
        value.contains('/') ||
        value.contains('\\') ||
        value.contains('}') ||
        value.contains('{') ||
        value.contains('@') ||
        value.contains('#') ||
        value.contains('!') ||
        value.contains('\$') ||
        value.contains('%') ||
        value.contains('^') ||
        value.contains('&') ||
        value.contains('*') ||
        value.contains('(') ||
        value.contains(')') ||
        value.contains('_') ||
        value.contains(',') ||
        value.contains('?') ||
        value.contains('+')) {
      return 'you cant use any special character\nlike # % ^ { } ( ) @ ! .';
    }
    return null;
  }
}
