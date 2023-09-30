import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/edit_id_widget/edit_id_screen.dart';

class EditeButton extends StatelessWidget {
  const EditeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const EditIdScreen()));
        },
        label:  Text('Edit',style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),),
        icon:  Icon(Icons.edit,size:MediaQuery.of(context).size.width * 0.08 ,),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
