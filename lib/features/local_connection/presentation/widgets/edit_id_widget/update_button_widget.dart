import 'package:flutter/material.dart';
import 'package:student_marker/core/data_source/cache_data.dart';
import 'package:student_marker/core/data_source/genral_var.dart';
import 'package:student_marker/core/injection/injection_model.dart';
import 'package:student_marker/features/local_connection/presentation/manager/connection_cubit.dart';

class UpdateIdButton extends StatelessWidget {
  final TextEditingController newStudentId;
  final GlobalKey<FormState> formKey;

  const UpdateIdButton({
    Key? key,
    required this.newStudentId,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          updateNamePressed(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff4489fe),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: const Text(
          'Update',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void updateNamePressed(BuildContext context) async{
    if (formKey.currentState!.validate()) {
     await  getIt<CacheData>()
          .setString(key: 'studentId', value: newStudentId.text)
          .then((value) {
            getIt<StudentInfo>().setStudentId(studentId: newStudentId.text);
        Navigator.pop(context);
        getIt<ConnectionCubit>().refreshStates();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xffffffff),
          duration: Duration(seconds: 2),
          content: Text(
            'ID updated successfully',
            style: TextStyle(color: Color(0xff000000)),
          ),
        ));
        newStudentId.text = '';
      });
    }
  }
}
