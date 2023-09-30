import 'package:flutter/material.dart';

class UpdateIdFiled extends StatelessWidget {
  final TextEditingController newStudentId;

  const UpdateIdFiled({Key? key,  required this.newStudentId}) : super(key: key);

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
          return studentIdValidate(value);
        },
      ),
    );
  }

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
