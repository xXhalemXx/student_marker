import 'package:flutter/material.dart';

class UpdateIdFiled extends StatelessWidget {
  final TextEditingController newStudentId;

  const UpdateIdFiled({super.key, required this.newStudentId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: newStudentId,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Color(0xff4489fe))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: 'Enter new ID',
        ),
        validator: (value) {
          return courseNameValidate(value);
        },
      ),
    );
  }

  String? courseNameValidate(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return 'You need to fill this field 😒';
    } else if (value.length != 14) {
      return 'national id must be 14 number';
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
