import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/edit_id_widget/edit_id_screen.dart';

class EditeButton extends StatelessWidget {
  const EditeButton({Key? key,required this.prefs}) : super(key: key);
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>EditIdScreen(prefs: prefs)));
      },
      label: const Text('Edit'),
      icon: const Icon(Icons.edit),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
