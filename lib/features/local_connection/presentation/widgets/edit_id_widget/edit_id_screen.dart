import 'package:flutter/material.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/edit_id_widget/update_id_main_widget.dart';

class EditIdScreen extends StatelessWidget {
  const EditIdScreen({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: UpdateIdWidget(),
    );
  }
}
